import 'package:flutter/material.dart';

import '../resourses/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: finalColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              'WECOME BACK',
              style: TextStyle(fontSize: 24),
            ),
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'phone',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1.5, color: textfieldborder)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1.5, color: textfieldborder)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: TextField(
                controller: passController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1.5, color: textfieldborder)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1.5, color: textfieldborder)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                style: const ButtonStyle(
                    alignment: Alignment.center,
                    textStyle: MaterialStatePropertyAll(TextStyle(
                      fontSize: 20,
                    )),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(248, 49, 184, 202)),
                    animationDuration: Duration(milliseconds: 2000))),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
