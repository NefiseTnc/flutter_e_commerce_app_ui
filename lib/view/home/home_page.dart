import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_e_commerce_app/constants/app_colors.dart';
import 'package:flutter_e_commerce_app/constants/app_image_paths.dart';
import 'package:flutter_e_commerce_app/model/brand_model.dart';
import 'package:flutter_e_commerce_app/model/product_model.dart';

import '../../companents/product_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
  ];

  final List<BrandModel> featuredBrandList = [
    BrandModel(title: 'B&o', imagePath: AppImagePaths.icBO, productList: []),
    BrandModel(
        title: 'Beats', imagePath: AppImagePaths.icBeats, productList: []),
    BrandModel(title: 'B&o', imagePath: AppImagePaths.icBO, productList: []),
    BrandModel(
        title: 'Beats', imagePath: AppImagePaths.icBeats, productList: []),
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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                _buildCategories(height, width),
                const SizedBox(height: 50),
                _buildProductList(
                    height: height,
                    width: width,
                    productList: bestSellingList,
                    title: 'Best Selling'),
                const SizedBox(height: 50),
                _buildFeaturedBrand(width, height),
                const SizedBox(height: 50),
                _buildProductList(
                    height: height,
                    width: width,
                    productList: recommendedList,
                    title: 'Recommended'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          const Expanded(
              flex: 8,
              child: SizedBox(
                height: 40,
                child: TextField(
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                    ),
                    fillColor: Color(0xFFF7F7F7),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 2, child: SvgPicture.asset(AppImagePaths.icSearchCamera)),
        ],
      ),
    );
  }

  Widget _buildCategories(double height, double width) {
    return SizedBox(
      height: height * .15,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    categories.values.elementAt(index),
                  ),
                ),
              ),
              Text(categories.keys.elementAt(index)),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedBrand(double width, double height) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Featured Brands',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 19,
        ),
        SizedBox(
          width: width,
          height: height * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredBrandList.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(15),
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
                        child: SvgPicture.asset(
                            featuredBrandList[index].imagePath),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            featuredBrandList[index].title,
                            style: const TextStyle(
                                color: AppColors.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${featuredBrandList[index].productList.length + 5693} Products',
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductList(
      {required double width,
      required double height,
      required String title,
      required List<ProductModel> productList}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 31,
        ),
        SizedBox(
          width: width,
          height: height * .4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ProductItemWidget(
                model: productList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
