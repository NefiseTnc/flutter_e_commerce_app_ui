import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/constants/app_image_paths.dart';
import 'package:readmore/readmore.dart';

import '../../constants/app_colors.dart';
import '../../constants/datas/datas.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String _value = 'S';
  Color _color = const Color(0xFF33427D);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomSheet: _buildBottomSheet(width, height),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          pinned: true,
          floating: true,
          backgroundColor: Colors.transparent,
          expandedHeight: height * .57,
          flexibleSpace: Stack(
            children: [
              SizedBox(
                width: width,
                child: Image.asset(
                  AppImagePaths.imProductDetails,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 30,
                child: _buildAppbar(width),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nike Dri-FIT Long Sleeve',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCustomSizeDropdown(width, height),
                      _buildCustomColorDropdown(width, height),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildReadMoreText(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Write a Comment',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildCommet(width, AppImagePaths.imAvatar1, 4),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildCommet(width, AppImagePaths.imAvatar2, 2),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildCommet(width, AppImagePaths.imAvatar1, 4),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildCommet(width, AppImagePaths.imAvatar2, 2),
                  SizedBox(
                    height: height * .1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  SizedBox _buildCommet(double width, String imagePath, int star) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Samuel Smith'),
                    Row(
                      children: [
                        for (int i = 0; i < star; i++)
                          const Icon(
                            Icons.star_outlined,
                            color: Colors.yellow,
                          ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Wonderful jean, perfect gift for my girl for our anniversary!')
              ],
            ),
          )
        ],
      ),
    );
  }

  ReadMoreText _buildReadMoreText() {
    return const ReadMoreText(
      'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
      style: TextStyle(
        fontSize: 14,
        height: 2,
      ),
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimExpandedText: 'Less',
      trimCollapsedText: 'Read more',
      moreStyle:
          TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
      lessStyle:
          TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCustomSizeDropdown(double width, double height) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: width * .4,
      height: height * .05,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFEBEBEB),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Size  ',
            style: TextStyle(fontSize: 14),
          ),
          DropdownButton<String>(
              underline: const SizedBox(),
              icon: const SizedBox(),
              borderRadius: BorderRadius.circular(50),
              value: _value,
              items: sizeList.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Center(
                    child: Text(
                      e,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _value = value ?? _value;
                });
              }),
        ],
      ),
    );
  }

  Widget _buildCustomColorDropdown(double width, double height) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: width * .4,
      height: height * .05,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFEBEBEB),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Color  ',
            style: TextStyle(fontSize: 14),
          ),
          DropdownButton<Color>(
              underline: const SizedBox(),
              icon: const SizedBox(),
              borderRadius: BorderRadius.circular(50),
              value: _color,
              items: colorList.map((e) {
                return DropdownMenuItem<Color>(
                  value: e,
                  child: Center(
                      child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        color: e, borderRadius: BorderRadius.circular(8)),
                  )),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _color = value ?? _color;
                });
              }),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: Colors.white,
        width: width,
        height: height * .08,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$1500',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  )
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColor,
                      fixedSize: const Size(120, 40)),
                  onPressed: () {},
                  child: const Text('ADD'))
            ]),
      ),
    );
  }

  Widget _buildAppbar(double width) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.star_border),
              ),
            )
          ],
        ),
      ),
    );
  }
}
