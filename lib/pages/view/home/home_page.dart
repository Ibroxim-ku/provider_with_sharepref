import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_sharepreferance/pages/controllers/note_controller.dart';
import 'package:provider_with_sharepreferance/pages/controllers/theme_controller.dart';
import 'package:provider_with_sharepreferance/pages/view/widgets/create_model.dart';

import '../widgets/edit_note.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themController = context.read<ThemeController>();
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController descriptionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            themController.changeTheme();
          },
          icon: Icon(
            themController.currentTheme == ThemeMode.light
                ? Icons.light_mode
                : Icons.dark_mode,
          ),
        ),
        title: const Text("NOTE APP"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<NoteController>(context, listen: false).removeItem();
            },
            icon: const Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      body: Consumer<NoteController>(
        builder: (context, value, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: value.allItems.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(value.allItems[index].title),
                        subtitle: Text(value.allItems[index].description),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditDialog(
                                  index: index,
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Checkbox(
                          value: value.allItems[index].isSelected,
                          onChanged: (isChanged) {
                            context
                                .read<NoteController>()
                                .changeValue(value.allItems[index]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WCreateamodel.createModel(context, titleCtrl, descriptionCtrl);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
