import 'package:expriment/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expriment/screens/home_screen.dart';

import '../utils/colors.dart';
import '../utils/firesotre.dart';
import '../utils/user_provider.dart';
import '../widgets/textfrome.dart';
import 'home_screen.dart';
import 'package:expriment/screens/home_screen.dart';

class BookingScreen extends StatefulWidget {
  // Function calling inputs
  final totalprice;
  final ml200;
  final ml500;
  final liter1;
  final can;

  const BookingScreen(
      {super.key,
      required this.totalprice,
      required this.can,
      required this.liter1,
      required this.ml200,
      required this.ml500});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController addressediting = TextEditingController();
  TextEditingController nameediting = TextEditingController();
  TextEditingController phoneediting = TextEditingController();
  var date = DateTime.now();
  bool valueSeted = false;
  bool booked = false;
  // Alert Dilog
  showdialog(String content) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            backgroundColor: Colors.red,
            title: const Text(
              'Alert!!',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              content,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }

  @override
  void dispose() {
    addressediting.dispose();
    phoneediting.dispose();
    nameediting.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    if (!valueSeted) {
      addressediting.text = userProvider.getUser.address;
      nameediting.text = userProvider.getUser.username;
      phoneediting.text = userProvider.getUser.phone;
      valueSeted = true;
    }

    return Scaffold(
      backgroundColor: finalbgcolor,
      appBar: AppBar(
        backgroundColor: finalbgcolor,
        // AppBar

        centerTitle: true,
        title: Text(
          'Total Price ₹${widget.totalprice}',
          style: TextStyle(color: Colors.black),
        ),
        // shape: const ContinuousRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // total price details

                const Spacer(
                  flex: 1,
                ),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: bgcolor1,
                        borderRadius: BorderRadius.circular(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // showing selected item count
                        Text(
                          '300 ml bottle    :   ₹${widget.ml200}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '500 ml bottle    :   ₹${widget.ml500}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '1 Liter bottle     :   ₹${widget.liter1}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '20 Liter can       :   ₹${widget.can} ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                // Details text field
                const Row(
                  children: [
                    Spacer(),
                    Text(
                      'Delivery address',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFrom(
                  controller: nameediting,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFrom(
                  controller: phoneediting,
                  keybord: TextInputType.number,
                  icon: const Icon(Icons.phone),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFrom(
                    controller: addressediting,
                    icon: const Icon(Icons.location_on)),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(
                  flex: 3,
                ),
                // Booking bottun
                Center(
                  child: SizedBox(
                    width: 140,
                    height: 70,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {
                        if (booked) {
                          showDialog(
                              context: context,
                              builder: (((context) => const AlertDialog(
                                    title: Text('Booked'),
                                    content: Text(
                                        'Your order is alredy booked \n Please reselect for new orders'),
                                  ))));
                        } else {
                          if (addressediting.text == '' ||
                              nameediting.text == '' ||
                              phoneediting.text == '') {
                            showdialog('Please Enter all details'); // validator
                          } else {
                            //conformation for order
                            showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    title: const Text(
                                      'Conform your order',
                                    ),
                                    content: const Text(
                                      'please conform your order',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Store store = Store();
                                          // upload order data into firebase firestore
                                          await store.upData(
                                              address: addressediting.text,
                                              l1: widget.ml200 as int,
                                              l2: widget.ml500 as int,
                                              l3: widget.liter1 as int,
                                              l4: widget.can as int,
                                              name: nameediting.text,
                                              phone: phoneediting.text,
                                              uid: userProvider.getUser.uid,
                                              finalprice:
                                                  widget.totalprice as int,
                                              date: date,
                                              status: "Pending",
                                              cusid: userProvider.getUser.uid);
                                          //show dialog for successfull booking

                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Your Order is successfully pleaced'),
                                              duration:
                                                  Duration(milliseconds: 500),
                                            ),
                                          );
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  )),
                            );
                          }
                        }
                      },
                      child: Center(
                        child: Image.asset(
                          'asstes/order2.png',
                          fit: BoxFit.contain,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
