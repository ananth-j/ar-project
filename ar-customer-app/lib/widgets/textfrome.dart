import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFrom extends StatelessWidget {
  final controller;
  final keybord;
  final icon;
  const TextFrom({super.key , required this.controller , this.keybord , required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              
              controller: controller,
              keyboardType: keybord ,
              minLines: 1,
              maxLines: null,
              
              decoration: InputDecoration(
                prefixIcon: icon,
                fillColor: textfrombgcolor,
                filled: true,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                      width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1.7),
                ),
              ),
            );
  }
}