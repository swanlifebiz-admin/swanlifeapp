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
}
