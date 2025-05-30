import 'package:expriment/mongo_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/text_field_dub.dart';
import '../utils/user_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isNotEdited = true;
  bool isLoading = false;
  var uid;
  editUser() {}
  getUserData() async {
    await Connector.getCustomer(uid);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    uid = userProvider.getUser.uid;
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'EDIT DETAILS',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: ((context) => const LoginScreen())));
                            },
                            child: const Text(
                              'CLOSE',
                              style: TextStyle(
                                  color: buttonColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 6,
                        width: 125,
                        color: buttonColor,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
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
                            //  _signUpUser();
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
                                'Done',
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
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
