class CategoriesDataItemModel {
  final int id;
  final String name;
  final String image;

  CategoriesDataItemModel(
      {required this.id, required this.name, required this.image});

  factory CategoriesDataItemModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataItemModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
