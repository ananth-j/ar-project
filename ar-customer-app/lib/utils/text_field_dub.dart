import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextFieldDube extends StatelessWidget {
  final Icon icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType type;
  const TextFieldDube({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: type,
        controller: controller,
        cursorColor: textFieldTextColor,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          helperStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: 0.4,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: foucusedBorderColor,
              width: 0.9,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldProEdit extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType type;
  const TextFieldProEdit({
    super.key,
    required this.hint,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        keyboardType: type,
        controller: controller,
        cursorColor: highliterColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          helperStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.5),
            borderSide: const BorderSide(
              color: enabledBorderColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.5),
            borderSide: const BorderSide(
              color: foucusedBorderColor,
              width: 1.7,
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldProEditAddress extends StatelessWidget {
  final String hint;
  final icon;
  final TextEditingController controller;
  const TextFieldProEditAddress({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: controller,
        cursorColor: textFieldTextColor,
        maxLines: 10,
        minLines: 1,
        decoration: InputDecoration(
          prefixIcon: icon,
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          helperStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: enabledBorderColor,
              width: 0.4,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: foucusedBorderColor,
              width: 0.9,
            ),
          ),
        ),
      ),
    );
  }
}
