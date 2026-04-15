class ProfileModel {
  final String _avatarImageUrl;
  final String name;
  final String rankSubtitle;
  final int daysActive;
  final int reflections;
  final String visionQuote;
  final String pondDescription;
  final double evolutionProgress;

  const ProfileModel({
    required String avatarImageUrl,
    required this.name,
    required this.rankSubtitle,
    required this.daysActive,
    required this.reflections,
    required this.visionQuote,
    required this.pondDescription,
    required this.evolutionProgress,
  }) : _avatarImageUrl = avatarImageUrl;

  String get avatarImageUrl => _avatarImageUrl;

  factory ProfileModel.dummy() {
    return const ProfileModel(
      avatarImageUrl:
          'https://resize.allw.mn/filters:format(webp)/filters:quality(70)/800x800/thumbs/76/ufvak7bk60gmpnq5e3c3t_1080x1350.jpg',
      name: 'Elara Vance',
      rankSubtitle: 'THE ETHEREAL PATH x TIER III',
      daysActive: 142,
      reflections: 32,
      visionQuote:
          '"To live with the grace of a swan-serene above the surface, while navigating the depths with purpose and silent strangth."',
      pondDescription:
          'Your ripple in the pond is expanding. Keep sharing your reflections and hold steady in your next step.',
      evolutionProgress: 0.68,
    );
  }
}