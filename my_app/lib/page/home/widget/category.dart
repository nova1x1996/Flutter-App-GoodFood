import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/page/home/widget/category_body.dart';
import 'package:my_app/page/home/widget/product.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static String RouteName = "/category";
  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("CategoryPage");
    final param = ModalRoute.of(context)?.settings.arguments as Map;
    var ListProduct = Provider.of<ProductProvider>(context)
        .getItemfromCateId(param["categoryId"]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        title: Text(param['title'].toString()),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: ListProduct.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  ListProduct[index].updateView();
                  print("gọi UpdateView");
                  Navigator.pushNamed(context, ProductPage.RouteName,
                      arguments: {
                        "productId": ListProduct[index].id,
                      });
                },
                child: ChangeNotifierProvider<Product>.value(
                  value: ListProduct[index],
                  child: CategoryBody(),
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20);
          }),
    );
  }
}
