import 'package:flutter_e_commerce_app/model/product_model.dart';

class BrandModel {
  final String title;
  final String imagePath;
  final List<ProductModel> productList;
  BrandModel({
    required this.title,
    required this.imagePath,
    required this.productList,
  });
}
