
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../model/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            model.imagePath,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            model.title,
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            model.description,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            '\$${model.price.toInt()}',
            style: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
