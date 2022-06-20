import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/constants/datas/datas.dart';

import '../../constants/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomSheet: _buildBottomSheet(width, height),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            _buildCartContentList(width, height),
            const SizedBox(
              height: 30,
            ),
            _buildTotalPrice('Sub Total', 3950),
            const SizedBox(
              height: 20,
            ),
            _buildTotalPrice('Tax', 50),
            const SizedBox(
              height: 17,
            ),
            _buildCodeTextField(height),
            SizedBox(
              height: height * .13,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartContentList(double width, double height) {
    return Expanded(
      child: SizedBox(
        width: width,
        child: ListView.builder(
          itemCount: cartList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: GlobalKey(),
              background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(30),
                color: const Color(0XFFFFC107),
                child: const Icon(
                  Icons.star_outlined,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(30),
                color: const Color(0xFFFF3D00),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                width: width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(cartList[index].imagePath),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartList[index].title),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$${cartList[index].price}',
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: width * .27,
                          height: height * .04,
                          color: const Color(0xFFF0F0F0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 10,
                                  )),
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 14),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 10,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildCodeTextField(double height) {
    return SizedBox(
      height: height * .05,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Voucher Code',
          hintStyle: TextStyle(fontSize: 12),
          suffix: Text(
            'APPLY',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPrice(String title, int price) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        const Expanded(
          child: Divider(),
        ),
        Text(
          '\$$price',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBottomSheet(double width, double height) {
    return Container(
      color: Colors.white,
      width: width,
      height: height * .08,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$4500',
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
                child: const Text('CHECKOUT'),
              )
            ]),
      ),
    );
  }
}
