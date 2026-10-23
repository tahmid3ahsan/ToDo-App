import 'package:flutter/material.dart';

class ButtonDialog extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  ButtonDialog({
      super.key,
      required this.text,
      required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}