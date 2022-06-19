import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/constants/app_colors.dart';
import '../../companents/product_item.dart';
import '../../constants/datas/datas.dart';
import '../../model/product_model.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchAppbar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: SizedBox(
              width: width,
              height: height * .05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(productCategories[index]),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: _buildProductList(
                height: height,
                width: width,
                productList: bestSellingList,
              ),
            ),
          ),
          _buildBottomFilter(width, height),
        ],
      ),
    );
  }

  Widget _buildBottomFilter(double width, double height) {
    return SizedBox(
      width: width,
      height: height * .07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'No filters applied',
            style: TextStyle(fontSize: 14),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
              onPressed: () {},
              child: const Text('FILTER'))
        ],
      ),
    );
  }

  Widget _buildSearchAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Gadgets',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildProductList(
      {required double width,
      required double height,
      required List<ProductModel> productList}) {
    return SizedBox(
      width: width,
      height: height * .60,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            mainAxisExtent: height * 0.40),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItemWidget(
            model: productList[index],
          );
        },
      ),
    );
  }
}
