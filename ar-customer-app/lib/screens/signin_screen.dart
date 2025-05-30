import 'package:flutter/material.dart';

import '../utils/auth_method.dart';
import '../utils/colors.dart';
import '../utils/text_field_dub.dart';
import '../widgets/textfeild.dart';
import 'login_screen.dart';
import 'package:expriment/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool passVisible = true;
  bool isLoading = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    addressController.dispose();
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

  bool isPassword = true;
  void NavigatToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }

  void _signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().singUpUser(
      email: emailController.text,
      password: passwordController.text,
      username: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
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
    } else if (res != 'success') {
      snackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading ? const  Center(child: CircularProgressIndicator(color: buttonColor,),)  : SingleChildScrollView(
        child: SafeArea(
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
                  'Please Sing Up to your Account to Continue with Us',
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
                    color: highliterColor,
                    size: 20,
                  ),
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
                TextFieldDube(
                  hint: 'Password',
                  icon: const Icon(
                    Icons.lock_outline_rounded,
                    color: highliterColor,
                    size: 20,
                  ),
                  controller: passwordController,
                  type: TextInputType.text,
                ),
                TextFieldDube(
                  hint: 'Name',
                  icon: const Icon(
                    Icons.person_2_outlined,
                    color: highliterColor,
                    size: 20,
                  ),
                  controller: nameController,
                  type: TextInputType.name,
                ),
                TextFieldDube(
                  hint: 'Phone',
                  icon: const Icon(
                    Icons.phone_android_sharp,
                    color: highliterColor,
                    size: 20,
                  ),
                  controller: phoneController,
                  type: TextInputType.phone,
                ),
                TextFieldProEditAddress( 
                  hint: 'Address',
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: highliterColor,
                    size: 20,
                  ),
                  controller: addressController,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    radius: 1000,
                    splashColor: Colors.grey.shade500,
                    focusColor: Colors.grey.shade300,
                    onTap: () {
                      _signUpUser();
                    },
                    child: Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(23),
                          border: Border.all(
                              width: 0.5, color: Colors.grey.shade100),
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
                          'SIGN UP',
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
                // const Spacer(),
              
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account. ',
                      style: TextStyle(
                        color: highliterColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const LoginScreen())));
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: buttonColor, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
