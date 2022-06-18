import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/constants/app_colors.dart';
import 'package:flutter_e_commerce_app/view/base_scaffold/base_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E Commerce',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(color: AppColors.textColor),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          elevation: 0,
        ),
      ),
      home: const BaseScaffold(),
    );
  }
}
