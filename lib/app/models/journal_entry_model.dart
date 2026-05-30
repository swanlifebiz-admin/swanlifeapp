class JournalEntryModel {
  final String? id;
  final String userId;
  final String trueReflection;
  final String theAnswer;
  final String? videoUrl;
  final String? imageUrl;
  final String? audioUrl;
  final DateTime createdAt;

  JournalEntryModel({
    this.id,
    required this.userId,
    required this.trueReflection,
    required this.theAnswer,
    this.videoUrl,
    this.imageUrl,
    this.audioUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'trueReflection': trueReflection,
      'theAnswer': theAnswer,
      'videoUrl': videoUrl,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory JournalEntryModel.fromMap(Map<String, dynamic> map, {String? docId}) {
    return JournalEntryModel(
      id: docId ?? map['id'],
      userId: map['userId'] ?? '',
      trueReflection: map['trueReflection'] ?? '',
      theAnswer: map['theAnswer'] ?? '',
      videoUrl: map['videoUrl'],
      imageUrl: map['imageUrl'],
      audioUrl: map['audioUrl'],
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt']) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
