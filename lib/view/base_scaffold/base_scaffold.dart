import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/constants/app_colors.dart';
import 'package:flutter_e_commerce_app/view/cart/cart_page.dart';
import 'package:flutter_e_commerce_app/view/home/home_page.dart';
import 'package:flutter_e_commerce_app/view/user/user_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_image_paths.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  List pages = [
    HomePage(),
    const CartPage(),
    const UserPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImagePaths.icHome), label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImagePaths.icCart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImagePaths.icUser), label: 'User'),
          ]),
    );
  }
}
