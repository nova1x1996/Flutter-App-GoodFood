import 'package:flutter/material.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/models/product.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatefulWidget {
  CategoryBody({
    super.key,
  });

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);
    print("Category Body");
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      height: 220,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: dFooterImage,
          title: Center(
            child: Text(
              product.title,
              style: dTextStyle,
            ),
          ),
          subtitle: Consumer<Product>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        value.updateIsFavorite();
                        print(value.isFavorite);
                      },
                      child: Icon(
                        Icons.favorite,
                        color: value.isFavorite ? Colors.red : Colors.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    value.favorite,
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.view_agenda,
                    color: value.isView
                        ? Colors.lightBlue
                        : dColorIconButtonInactive,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(value.view, style: TextStyle(color: Colors.black)),
                ],
              );
            },
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(fit: BoxFit.cover, product.image),
        ),
      ),
    );
  }
}
