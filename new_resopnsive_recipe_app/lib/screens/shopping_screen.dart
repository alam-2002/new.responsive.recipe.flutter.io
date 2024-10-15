import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app_youtube/commons/custom_app_bar.dart';
import 'package:recipe_app_youtube/commons/share.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({super.key});

  var myBox = Hive.box('shopping');

  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Shopping',
        back: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: myBox.listenable(),
        builder: (context, box, _) {
          var data = box.values.toList();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: kHEIGHT * .085,
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Label(
                          label: data[index],
                          fontSize: 15,
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                value: 'share', child: Label(label: 'share')),
                            PopupMenuItem(
                                value: 'delete', child: Label(label: 'delete')),
                          ];
                        },
                        onSelected: (value) async {
                          if (value == 'delete') {
                            _deleteItem(index);
                          } else if (value == 'share') {
                            ShareRecipes.share(data[index]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deleteItem(int index) async {
    var myBox = Hive.box('shopping');
    await myBox.deleteAt(index);
  }
}
