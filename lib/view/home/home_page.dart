import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/view/product_details/product_details_page.dart';
import 'package:flutter_e_commerce_app/view/product_list/product_list_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_e_commerce_app/constants/app_colors.dart';
import 'package:flutter_e_commerce_app/constants/app_image_paths.dart';
import 'package:flutter_e_commerce_app/model/product_model.dart';

import '../../companents/brand_item_widget.dart';
import '../../companents/product_item.dart';
import '../../constants/datas/datas.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                _buildBrand(width, height),
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
            ),
          ),
          const SizedBox(width: 15),
          SvgPicture.asset(AppImagePaths.icSearchCamera),
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
          return InkWell(
            onTap: () {
              if (categories.keys.elementAt(index) == 'Gadgets') {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProductListPage()));
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.grey.withOpacity(.1)),
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildBrand(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Brands',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 19,
        ),
        SizedBox(
          width: width,
          height: height * .12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredBrandList.length,
            itemBuilder: (context, index) {
              return BrandItemWidget(
                model: featuredBrandList[index],
              );
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
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductDetailsPage(),
                      ));
                },
                child: ProductItemWidget(
                  model: productList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
