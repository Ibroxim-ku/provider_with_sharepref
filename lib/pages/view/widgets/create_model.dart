import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_sharepreferance/pages/controllers/note_controller.dart';
import 'package:provider_with_sharepreferance/pages/models/notes_model.dart';

class WCreateamodel {
  static void createModel(BuildContext context, TextEditingController titleCtrl,
      TextEditingController descriptionCtrl) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create Note", style: TextStyle(fontSize: 16),),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(
                  hintText: " Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: descriptionCtrl,
                decoration: const InputDecoration(
                  hintText: " Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Note note = Note(
                    title: titleCtrl.text, description: descriptionCtrl.text);
                context.read<NoteController>().addItem(note);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
