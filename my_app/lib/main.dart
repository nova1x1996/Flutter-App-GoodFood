import 'package:flutter/material.dart';
import 'package:my_app/page/favorite/favorite_body.dart';
import 'package:my_app/page/home/home_body.dart';
import 'package:my_app/page/seen/seen_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentBottomBar = 0;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Good Food"),
        centerTitle: true,
      ),
      body: Center(
        child: listContentBody[currentBottomBar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedFontSize: 15,
        selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 40),
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
  }
}
