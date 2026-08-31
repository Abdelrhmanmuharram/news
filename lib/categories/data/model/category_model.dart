class CategoryModel {
  final String id;
  final String name;
  final String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(id: 'general', name: 'General', imageName: 'general'),
    CategoryModel(id: 'business', name: 'Business', imageName: 'business'),
    CategoryModel(id: 'sports', name: 'Sport', imageName: 'sport'),
    CategoryModel(
      id: 'technology',
      name: 'Technology',
      imageName: 'technology',
    ),
    CategoryModel(
      id: 'entertainment',
      name: 'Entertainment',
      imageName: 'entertainment',
    ),
    CategoryModel(id: 'health', name: 'Health', imageName: 'health'),
    CategoryModel(id: 'science', name: 'Science', imageName: 'science'),
  ];
  static List<CategoryModel> categoriesArabic = [
    CategoryModel(id: 'general', name: 'عام', imageName: 'general_arabic'),
    CategoryModel(id: 'business', name: 'عمل', imageName: 'busniess_arabic'),
    CategoryModel(id: 'sports', name: 'رياضة', imageName: 'sport_arabic'),
    CategoryModel(
      id: 'technology',
      name: 'تكنولوجيا',
      imageName: 'technology_arabic',
    ),
    CategoryModel(
      id: 'entertainment',
      name: 'ترفيه',
      imageName: 'entertainment_arabic',
    ),
    CategoryModel(id: 'health', name: 'صحة', imageName: 'health_arabic'),
    CategoryModel(id: 'science', name: 'علوم', imageName: 'science_arabic'),
  ];
}
