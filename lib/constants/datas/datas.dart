import 'package:flutter/material.dart';
import '../../model/brand_model.dart';
import '../../model/product_model.dart';
import '../app_image_paths.dart';

//home page data
final categories = {
  'Men': AppImagePaths.icMen,
  'Women': AppImagePaths.icWomens,
  'Devices': AppImagePaths.icDevices,
  'Gadgets': AppImagePaths.icGadgets,
  'Gaming': AppImagePaths.icGaming,
  'Men1': AppImagePaths.icMen,
  'Women1': AppImagePaths.icWomens,
  'Devices1': AppImagePaths.icDevices,
  'Gadgets1': AppImagePaths.icGadgets,
  'Gaming1': AppImagePaths.icGaming,
};

final List<ProductModel> bestSellingList = [
  ProductModel(
    title: 'BeoPlay Speaker',
    description: 'Bang and Olufsen',
    price: 755,
    imagePath: AppImagePaths.imProduct1,
    isNew: true,
  ),
  ProductModel(
    title: 'Leather Wristwatch',
    description: 'Tag Heuer',
    price: 450,
    imagePath: AppImagePaths.imProduct2,
  ),
  ProductModel(
    title: 'Wireless Remote',
    description: 'Tesla Inc',
    price: 790,
    imagePath: AppImagePaths.imProduct3,
  ),
  ProductModel(
    title: 'Airpods',
    description: 'Apple Inc',
    price: 120,
    imagePath: AppImagePaths.imProduct4,
  ),
  ProductModel(
    title: 'Smart Bluetooth Speaker',
    description: 'Google LLC',
    price: 9000,
    imagePath: AppImagePaths.imProduct1,
  ),
  ProductModel(
    title: 'Smart Luggage',
    description: 'Smart Inc',
    price: 450,
    imagePath: AppImagePaths.imProduct2,
  ),
  ProductModel(
    title: 'Wireless Remote',
    description: 'Tesla Inc',
    price: 790,
    imagePath: AppImagePaths.imProduct3,
  ),
  ProductModel(
    title: 'Airpods',
    description: 'Apple Inc',
    price: 120,
    imagePath: AppImagePaths.imProduct4,
  ),
];

final List<BrandModel> featuredBrandList = [
  BrandModel(title: 'B&o', imagePath: AppImagePaths.icBO, productList: []),
  BrandModel(title: 'Beats', imagePath: AppImagePaths.icBeats, productList: []),
  BrandModel(title: 'B&o', imagePath: AppImagePaths.icBO, productList: []),
  BrandModel(title: 'Beats', imagePath: AppImagePaths.icBeats, productList: []),
];

final List<ProductModel> recommendedList = [
  ProductModel(
    title: 'Wireless Remote',
    description: 'Tesla Inc',
    price: 790,
    imagePath: AppImagePaths.imProduct3,
  ),
  ProductModel(
    title: 'Airpods',
    description: 'Apple Inc',
    price: 120,
    imagePath: AppImagePaths.imProduct4,
  ),
  ProductModel(
    title: 'BeoPlay Speaker',
    description: 'Bang and Olufsen',
    price: 755,
    imagePath: AppImagePaths.imProduct1,
  ),
  ProductModel(
    title: 'Leather Wristwatch',
    description: 'Tag Heuer',
    price: 450,
    imagePath: AppImagePaths.imProduct2,
  ),
];

//product_list data
final List productCategories = ['All', 'Headphones', 'Speakers', 'Microphones'];

//product details page datas
final List<String> sizeList = ['XS', 'S', 'M', 'L', 'XL', '2XL', '3XL'];
final List<Color> colorList = [
  Colors.black,
  Colors.blueAccent.shade700,
  Colors.amber,
  Colors.pink,
  Colors.teal,
  Colors.purple,
  const Color(0xFF33427D),
];
