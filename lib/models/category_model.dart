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
}
