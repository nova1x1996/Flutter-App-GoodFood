import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/page/home/widget/category.dart';
import 'package:my_app/providers/category_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        List<Category>? ListcategoryItem =
            snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: ListcategoryItem?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) {
                      //   return CategoryPage(title: index);
                      // }));
                      Navigator.pushNamed(
                        context,
                        CategoryPage.RouteName,
                        arguments: {
                          "title": ListcategoryItem?[index].name,
                          "categoryId": ListcategoryItem?[index].id,
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(ListcategoryItem![index].image),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                              child: Text(
                                ListcategoryItem![index].name,
                                style: dTextStyle,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                            flex: 1),
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: Text("Not Have Data"),
              );
      },
    );
  }
}
