import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];
  List<Category> get getItems => [..._items];

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');

    List result = jsonDecode(response);
    List<Category> data = result.map((e) => Category.fromMap(e)).toList();
    _items = data;

    return data;
  }
}
