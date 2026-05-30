class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? profilePic;
  final DateTime? createdAt;
  final String? rankSubtitle;
  final String? visionQuote;
  final String? pondDescription;
  final double? evolutionProgress;
  final String? intentionalPresence;
  final String? wealthMindset;
  final String? boundarySetting;
  final String? swanShares;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.profilePic,
    this.createdAt,
    this.rankSubtitle,
    this.visionQuote,
    this.pondDescription,
    this.evolutionProgress,
    this.intentionalPresence,
    this.wealthMindset,
    this.boundarySetting,
    this.swanShares,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'createdAt': createdAt?.toIso8601String(),
      'rankSubtitle': rankSubtitle,
      'visionQuote': visionQuote,
      'pondDescription': pondDescription,
      'evolutionProgress': evolutionProgress,
      'intentionalPresence': intentionalPresence,
      'wealthMindset': wealthMindset,
      'boundarySetting': boundarySetting,
      'swanShares': swanShares,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      profilePic: map['profilePic'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      rankSubtitle: map['rankSubtitle'],
      visionQuote: map['visionQuote'],
      pondDescription: map['pondDescription'],
      evolutionProgress: map['evolutionProgress'] != null ? (map['evolutionProgress'] as num).toDouble() : null,
      intentionalPresence: map['intentionalPresence'],
      wealthMindset: map['wealthMindset'],
      boundarySetting: map['boundarySetting'],
      swanShares: map['swanShares'],
    );
  }
}

