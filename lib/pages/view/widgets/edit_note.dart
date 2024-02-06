import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_sharepreferance/pages/controllers/note_controller.dart';

// ignore: must_be_immutable
class EditDialog extends StatelessWidget {
  int index;
  EditDialog({super.key, this.index = 0});

  TextEditingController newTitleCtrl = TextEditingController();
  TextEditingController newDesCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Note'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: newTitleCtrl,
            decoration: const InputDecoration(
              hintText: 'Enter New Tittle',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: newDesCtrl,
            decoration: const InputDecoration(
              hintText: 'Enter New Description',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<NoteController>(context, listen: false).updateItemValue(
                Provider.of<NoteController>(context, listen: false)
                    .allItems[index],
                newTitleCtrl.text,
                newDesCtrl.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
