import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/config/const.dart';
import 'package:my_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    print("FavoriteBody Page");
    var listModel = Provider.of<ProductProvider>(context).getItemFavorite();

    return ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: listModel.length,
      itemBuilder: (context, index) {
        var model = listModel[index];
        return Dismissible(
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Delete'),
                content: const Text('Separate : Chia nhỏ ra , tách nhỏ ra'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            model.deleteFavorite();
          },
          key: ValueKey<int>(index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              width: double.infinity,
              height: 150,
              child: GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.white70,
                  title: Text(
                    model.title,
                    style: dTextStyle,
                  ),
                  trailing: Icon(
                    Icons.swipe,
                    color: dColorIconButtonInactive,
                    size: sizeIconButton,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(model.image)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
