// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class roundedButton extends StatelessWidget {
  Color color;
  String title;
  void Function()? onPressed;
  roundedButton(this.color, this.title, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
