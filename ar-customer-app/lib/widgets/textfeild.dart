import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  final TextEditingController textEditor;
  final String hintText;
  final TextInputType inputtype;

  const TextFieldPage({
    super.key,
    required this.textEditor,
    required this.hintText,
    required this.inputtype,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditor,
      decoration: InputDecoration(
        labelText: hintText,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: inputtype,
    );
  }
}
