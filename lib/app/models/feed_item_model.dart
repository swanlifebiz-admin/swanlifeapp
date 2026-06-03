class FeedItemModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String category;
  final String? videoUrl;

  const FeedItemModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.category,
    this.videoUrl,
  });
}