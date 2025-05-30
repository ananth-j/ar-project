import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mongo_db.dart';
import '../pages/about.dart';
import '../pages/contact.dart';
import '../pages/details_edit.dart';
import '../utils/auth_method.dart';
import '../utils/colors.dart';
import '../utils/user_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String phone = '';
  String address = '';
  bool isEdit = false;

  dialogbox() {
    return showDialog(
      context: context,
      builder: (((context) => AlertDialog(
            title: const Text('Alert!!'),
            content: const Text('Do you want edit address permanently'),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Yes'),
              ),
            ],
          ))),
    );
  }

  // for logout lert dialog
  showdialog(String alert, String content) {
    return showDialog(
        context: context,
        builder: (((context) => AlertDialog(
              title: Text(alert),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:
                      const Text('No', style: TextStyle(color: Colors.green)),
                ),
                TextButton(
                  onPressed: () {
                    AuthMethods sign = AuthMethods();
                    sign.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (((context) => const LoginScreen()))));
                  },
                  child: const Text('Yes', style: TextStyle(color: Colors.red)),
                ),
              ],
            ))));
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    setState(() {
      name = userProvider.getUser.username;
      phone = userProvider.getUser.phone;
      address = userProvider.getUser.address;
    });
    return Scaffold(
        backgroundColor: finalbgcolor,
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: finalbgcolor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 244, 255),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            phone,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Text(
                              address, maxLines: 5,
                              //   softWrap: false,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showdialog('Alert!!', 'conform your logout');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (((context) => const Contact()))));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.quick_contacts_dialer_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Contact Us',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (((context) => const About()))));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.support_agent_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Customer Care',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                // MaterialButton(
                //   onPressed: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (((context) => const EditProfile()))));
                //   },
                //   child: const Row(
                //     children: [
                //       Icon(Icons.edit_note_outlined),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Text(
                //         'Edit Your Details',
                //         style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.w500),
                //       )
                //     ],
                //   ),
                // ),
                // Card(
                //   color: Color.fromARGB(255, 228, 225, 225),
                //   child: InkWell(
                //     borderRadius: BorderRadius.circular(3),
                //     onTap: () {},
                //     child: Container(
                //       alignment: Alignment.center,
                //       padding: const EdgeInsets.all(9),
                //       width: double.infinity,
                //       child: const Text(
                //         'Create your won app',
                //         style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
