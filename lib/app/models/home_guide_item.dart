class HomeGuideItem {
  final String title;
  final String category;
  final String imageUrl;

  const HomeGuideItem({
    required this.title,
    required this.category,
    required this.imageUrl,
  });
}




  final List<HomeGuideItem> HomeGuideItems = [
    HomeGuideItem(
      title: 'Vagal Nerve Soothing',
      category: 'Breathwork',
      imageUrl:
          'https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=900&q=80',
    ),
    HomeGuideItem(
      title: 'Swan-Life Meditation',
      category: 'Meditation',
      imageUrl:
          'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?auto=format&fit=crop&w=900&q=80',
    ),
    HomeGuideItem(
      title: 'Rhythm Journaling',
      category: 'Journaling',
      imageUrl:
          'https://images.unsplash.com/photo-1455390582262-044cdead277a?auto=format&fit=crop&w=900&q=80',
    ),
    HomeGuideItem(
      title: 'Body Presence Ritual',
      category: 'Ritual',
      imageUrl:
          'https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=900&q=80',
    ),
  ];
