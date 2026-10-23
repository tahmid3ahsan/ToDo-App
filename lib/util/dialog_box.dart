import 'package:flutter/material.dart';
import 'package:todo_app/util/button_dialog.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      backgroundColor: Colors.green,
      content: Container(
        width: double.maxFinite,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task."
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(text: "Save", onPressed: onSave),
                const SizedBox(width: 8,),
                ButtonDialog(text: "Cancel", onPressed: onCancel),
              ],
            )
          ], //children
        ),
      ),
    );
  }
}