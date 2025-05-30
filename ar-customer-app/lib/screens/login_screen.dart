import 'package:expriment/screens/home_screen.dart';
import 'package:expriment/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../utils/auth_method.dart';
import '../utils/colors.dart';
import '../utils/text_field_dub.dart';
import '../widgets/textfeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool passVisible = true;
  bool isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  snackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
        ),
      ),
    );
  }

  void navigatToSingUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const SignUpScreen())));
  }

  void _loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passController.text,
    );
    setState(() {
      isLoading = false;
    });
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        ),
      );
    } else {
      snackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading ? const  Center(child: CircularProgressIndicator(color: buttonColor,),)  : SafeArea(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: NetworkImage(
          //             'https://firebasestorage.googleapis.com/v0/b/instagram-63396.appspot.com/o/test%2Fpngwing.com%20(9).png?alt=media&token=543aded9-ab80-4d89-8aee-d0f93fac5559'),fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Sing Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Container(
                height: 6,
                width: 60,
                color: buttonColor,
              ),
              const SizedBox(height: 30),
              Text(
                'Please Sing In to your Account to Continue with Us',
                style: TextStyle(
                  fontSize: 14,
                  color: highliterColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextFieldDube(
                hint: 'Email',
                icon: const Icon(
                  Icons.email_outlined,
                  color: buttonColor,
                  size: 20,
                ),
                controller: _emailController,
                type: TextInputType.emailAddress,
              ),
              TextFieldDube(
                hint: 'Password',
                icon: const Icon(
                  Icons.lock_outline_rounded,
                  color: buttonColor,
                  size: 20,
                ),
                controller: _passController,
                type: TextInputType.text,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  radius: 1000,
                  splashColor: Colors.grey.shade500,
                  focusColor: Colors.grey.shade300,
                  onTap: () {
                    _loginUser();
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(23),
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade100),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(12, 0, 0, 0),
                            blurRadius: 10,
                            // spreadRadius: 10,
                            offset: Offset(10, 15),
                          )
                        ]),
                    child: const Center(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            height: 1,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'Don\'t Have an Account. ',
                  style: TextStyle(
                    color: highliterColor,
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    navigatToSingUp();
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: buttonColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
