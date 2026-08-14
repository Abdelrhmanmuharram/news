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
    CategoryModel(id: '', name: 'General', imageName: 'general'),
    CategoryModel(id: '', name: 'Business', imageName: 'business'),
    CategoryModel(id: '', name: 'Sport', imageName: 'sport'),
    CategoryModel(id: '', name: 'Technology', imageName: 'technology'),
    CategoryModel(id: '', name: 'Entertainment', imageName: 'entertainment'),
    CategoryModel(id: '', name: 'Health', imageName: 'health'),
    CategoryModel(id: '', name: 'Science', imageName: 'science'),
  ];
  static List<CategoryModel> categoriesArabic = [
    CategoryModel(id: '', name: 'عام', imageName: 'general_arabic'),
    CategoryModel(id: '', name: 'عمل', imageName: 'busniess_arabic'),
    CategoryModel(id: '', name: 'رياضة', imageName: 'sport_arabic'),
    CategoryModel(id: '', name: 'تكنولوجيا', imageName: 'technology_arabic'),
    CategoryModel(id: '', name: 'ترفيه', imageName: 'entertainment_arabic'),
    CategoryModel(id: '', name: 'صحة', imageName: 'health_arabic'),
    CategoryModel(id: '', name: 'علوم', imageName: 'science_arabic'),
  ];
}
