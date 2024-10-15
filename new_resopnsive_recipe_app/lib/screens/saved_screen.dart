import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app_youtube/commons/custom_app_bar.dart';
import 'package:recipe_app_youtube/commons/share.dart';
import 'package:recipe_app_youtube/commons/text_widget.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});

  var myBox = Hive.box('saved');
  @override
  Widget build(BuildContext context) {
    final kHEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bookmarks',
        back: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          right: 8,
          left: 8,
        ),
        child: ValueListenableBuilder(
          valueListenable: myBox.listenable(),
          builder: (ctx, box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (ctx, index) {
                var data = box.values.toList();
                return ListTile(
                  title: Container(
                    height: kHEIGHT * .085,
                    color: Colors.grey[100],
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Label(label: data[index]),
                        ),
                        PopupMenuButton(
                          itemBuilder: (ctx) {
                            return [
                              PopupMenuItem(
                                value: 'share',
                                child: Label(label: 'share'),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Label(label: 'delete'),
                              ),
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
      ),
    );
  }

  Future<void> _deleteItem(int index) async {
    var myBox = Hive.box('saved');
    await myBox.deleteAt(index);
  }
}
