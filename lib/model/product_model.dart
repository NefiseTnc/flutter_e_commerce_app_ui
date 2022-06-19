class ProductModel {
  final String title;
  final String description;
  final double price;
  final String imagePath;
  final bool isNew;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isNew=false,
  });
}
