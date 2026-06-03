import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/journal_entry_model.dart';
import 'package:path/path.dart' as p;

class JournalRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> saveJournalEntry(JournalEntryModel entry) async {
    try {
      final docRef = _db.collection('journals').doc();
      final data = entry.toMap();
      data['id'] = docRef.id;
      await docRef.set(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadJournalAsset(String userId, String filePath, String folder) async {
    try {
      final extension = p.extension(filePath);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}$extension';
      final ref = _storage.ref().child('journals/$userId/$folder/$fileName');
      final file = File(filePath);
      
      final uploadTask = await ref.putFile(file);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadJournalVideo(String userId, String filePath) async {
    return uploadJournalAsset(userId, filePath, 'videos');
  }

  Future<int> getReflectionCount(String userId) async {
    try {
      final snapshot = await _db
          .collection('journals')
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs.length;
    } catch (e) {
      return 0;
    }
  }

  Future<JournalEntryModel?> getLatestTextJournal(String userId) async {
    try {
      final snapshot = await _db
          .collection('journals')
          .where('userId', isEqualTo: userId)
          .get();
      
      final entries = snapshot.docs
          .map((doc) => JournalEntryModel.fromMap(doc.data(), docId: doc.id))
          .toList();
      
      // Sort in-memory to avoid needing composite Firestore index
      entries.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      for (final entry in entries) {
        if (entry.trueReflection.trim().isNotEmpty || entry.theAnswer.trim().isNotEmpty) {
          return entry;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Returns [textCount, videoCount, mediaCount] in one Firestore round-trip.
  Future<({int textCount, int videoCount, int mediaCount})> getActivityStats(
    String userId,
  ) async {
    try {
      final snapshot = await _db
          .collection('journals')
          .where('userId', isEqualTo: userId)
          .get();

      int text = 0, video = 0, media = 0;
      for (final doc in snapshot.docs) {
        final d = doc.data();
        final hasText =
            (d['trueReflection'] as String? ?? '').trim().isNotEmpty ||
            (d['theAnswer'] as String? ?? '').trim().isNotEmpty;
        final hasVideo = (d['videoUrl'] as String?) != null;
        final hasMedia =
            (d['audioUrl'] as String?) != null ||
            (d['imageUrl'] as String?) != null;

        if (hasText) text++;
        if (hasVideo) video++;
        if (hasMedia) media++;
      }
      return (textCount: text, videoCount: video, mediaCount: media);
    } catch (_) {
      return (textCount: 0, videoCount: 0, mediaCount: 0);
    }
  }
}
