class GategoriesDataItemModel {
  final int id;
  final String name;
  final String image;

  GategoriesDataItemModel(
      {required this.id, required this.name, required this.image});

  factory GategoriesDataItemModel.fromJson(Map<String, dynamic> json) {
    return GategoriesDataItemModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
