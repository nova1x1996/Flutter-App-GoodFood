import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get getItems => [..._items];

  List<Product> getItemfromCateId(String cateId) {
    return _items.where((element) => element.categoryId == cateId).toList();
  }

  List<Product> getItemFavorite() {
    return _items.where((element) => element.isFavorite == true).toList();
  }

  List<Product> getItemView() {
    return _items.where((element) => element.isView == true).toList();
  }

  Product getOneItem(String id) {
    return _items.where((element) => element.id == id).single;
  }

  Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');

    List result = jsonDecode(response);
    List<Product> data = result.map((e) => Product.fromMap(e)).toList();
    _items = data;
    return data;
  }
}
