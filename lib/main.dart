import 'package:codforge_demo/screens/bottomNavigationBar/my_bottom_navigation_bar.dart';
import 'package:codforge_demo/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home:  MyBottomNavigationBar(),
    );
  }
}
