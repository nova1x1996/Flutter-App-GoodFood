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

class MyHomePage extends StatefulWidget {
  static const String RouteName = "/";
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentBottomBar = 0;
  late Future bienTam;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bienTam = Provider.of<ProductProvider>(context).readJson();
  }

  @override
  updateCurrentBottomBar(int value) {
    setState(() {
      currentBottomBar = value;
    });
  }

  List<Widget> listContentBody = [
    HomeBody(),
    FavoriteBody(),
    SeenBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bienTam,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: dColorMain,
            title: Text("Good Food"),
            centerTitle: true,
          ),
          body: Center(
            child: listContentBody[currentBottomBar],
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: sizeIconButton,
            backgroundColor: dColorMain,
            selectedItemColor: Colors.deepOrange,
            unselectedFontSize: 15,
            selectedIconTheme: IconThemeData(size: 35),
            unselectedIconTheme: IconThemeData(size: 30),
            selectedFontSize: 20,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.home),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.macro_off),
                ),
                label: "Middle",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.e_mobiledata_outlined),
                ),
                label: "End",
              ),
            ],
            onTap: (value) {
              updateCurrentBottomBar(value);
            },
            currentIndex: currentBottomBar,
          ),
        );
      },
    );
  }
}
