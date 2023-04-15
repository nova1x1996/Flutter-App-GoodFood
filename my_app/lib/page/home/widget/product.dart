import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  static String RouteName = "/product";
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
    void hamabc() {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Product");
    var param = ModalRoute.of(context)?.settings.arguments as Map;
    var product =
        Provider.of<ProductProvider>(context).getOneItem(param['productId']);

    return Scaffold(
      body: ChangeNotifierProvider<Product>.value(
        value: product,
        builder: (context, child) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.amber,
                      child: Consumer<Product>(
                        builder: (context, value, child) => GridTile(
                          child: Image.asset(fit: BoxFit.cover, value.image),
                          footer: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 120,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25)),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        value.updateIsFavorite();
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: value.isFavorite
                                            ? Colors.redAccent
                                            : dColorIconButtonInactive,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      value.favorite,
                                      style: dStyleTitleIcon,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25)),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.view_agenda,
                                      color: value.isView
                                          ? Colors.lightBlue
                                          : dColorIconButtonInactive,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      value.view,
                                      style: dStyleTitleIcon,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        left: 10,
                        child: BackButton(
                          color: dColorMain,
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(25),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/background/background_product.png"))),
                    child: Column(
                      children: [
                        Text(product.title),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 167,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  "Nguyên liệu",
                                  style: dTextStyle,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(product.ingredients),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 167,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  "Nguyên liệu",
                                  style: dTextStyle,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(product.instructions),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
