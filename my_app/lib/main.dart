import 'package:flutter/material.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/page/favorite/favorite_body.dart';
import 'package:my_app/page/home/home_body.dart';
import 'package:my_app/page/home/widget/category.dart';
import 'package:my_app/page/home/widget/product.dart';
import 'package:my_app/page/index.dart';
import 'package:my_app/page/seen/seen_body.dart';
import 'package:my_app/providers/category_provider.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return CategoryProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          MyHomePage.RouteName: (context) => MyHomePage(),
          CategoryPage.RouteName: (context) => CategoryPage(),
          ProductPage.RouteName: (context) => ProductPage(),
        },
      ),
    );
  }
}
