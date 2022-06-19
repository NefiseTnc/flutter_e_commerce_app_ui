import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../model/brand_model.dart';

class BrandItemWidget extends StatelessWidget {
  const BrandItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final BrandModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: const Color(0xFF707070).withOpacity(.03),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(model.imagePath),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${model.productList.length + 5693} Products',
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
