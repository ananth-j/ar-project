import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'booking_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _fristcontroller = TextEditingController();
  final TextEditingController _secondcontroller = TextEditingController();
  final TextEditingController _thredcontroller = TextEditingController();
  final TextEditingController _fourthcontroller = TextEditingController();
  int fristprice = 0;
  int secondprice = 0;
  int thredprice = 0;
  int fourthprice = 0;

  int finalprice = 0;
  @override
  int total() {
    finalprice = fristprice + secondprice + thredprice + fourthprice;
    return finalprice;
  }

  snacshow(String name, String detail) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Text(detail),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ok',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: finalbgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                const SizedBox(
                  height: 9,
                ),
                // frist section
                Card(
                  color: bgcolor1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            snacshow('Mini Bottle',
                                '* 1 Bundle = 25 bottles \n* 1 Bundle Rs ₹250 \n* 300 ml is 1 bottle');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asstes/200ml.png',
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '₹$fristprice',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        // this is for total and price
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                // height: 40,
                                child: TextField(
                                  controller: _fristcontroller,
                                  onChanged: (value) {
                                    // pricing calculator
                                    try {
                                      if (value != '') {
                                        setState(() {
                                          fristprice = (250 * int.parse(value));
                                        });
                                      } else {
                                        setState(() {
                                          fristprice = 0;
                                          ;
                                        });
                                      }
                                    } catch (e) {
                                      e.toString();
                                    }
                                    // finalprice = finalprice + fristprice ;
                                  },
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: bgcolor2,
                                    hintText: 'ex 5',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(11),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: bgcolor3,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                  ),
                ),
                // secend section
                Card(
                  color: bgcolor1,
                  //padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            snacshow('Midium Bottle',
                                '* 1 Bundle = 20 bottles \n* 1 Bundle Rs ₹250 \n* 500ml is one bottle');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asstes/1l.png',
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ),
                        // const CircleAvatar(
                        //   backgroundImage: AssetImage('asstes/1l.png'),
                        //   radius: 57,
                        // ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '₹$secondprice',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        // this is for total and price
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                // height: 40,
                                child: TextField(
                                  controller: _secondcontroller,
                                  onChanged: (value) {
                                    // pricing calculator
                                    try {
                                      if (value != '') {
                                        setState(() {
                                          secondprice =
                                              (250 * int.parse(value));
                                        });
                                      } else {
                                        setState(() {
                                          secondprice = 0;
                                        });
                                      }
                                    } catch (e) {
                                      e.toString();
                                    }
                                  },
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: bgcolor2,
                                    hintText: 'ex 5',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(11),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: bgcolor3,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                  ),
                ),
                // thred section
                Card(
                  //elevation: 6,
                  color: bgcolor1,
                  //padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            snacshow('1 Liter Bottle',
                                '* 1 Bundle = 15 bottles \n* 1 Bundle Rs ₹200 \n* 1 Liter in every single bottle');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asstes/1l.png',
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ),
                        // const CircleAvatar(
                        //   backgroundImage: AssetImage('asstes/1l.png'),
                        //   radius: 57,
                        // ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '₹$thredprice',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        // this is for total and price
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                // height: 40,
                                child: TextField(
                                  controller: _thredcontroller,
                                  onChanged: (value) {
                                    // pricing calculator
                                    try {
                                      if (value != '') {
                                        setState(() {
                                          thredprice = (200 * int.parse(value));
                                        });
                                      } else {
                                        setState(() {
                                          thredprice = 0;
                                        });
                                      }
                                    } catch (e) {
                                      e.toString();
                                    }
                                    //finalprice = finalprice + thredprice;
                                  },
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: bgcolor2,
                                    hintText: 'ex 5',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(11),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: bgcolor3,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: bgcolor1,
                  //padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            snacshow('20 Liter Can',
                                '* 1 Can Rs ₹35 \n* 20 liter in every single can');
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asstes/20l.png',
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ),
                        // const CircleAvatar(
                        //   backgroundImage: AssetImage('asstes/21l.png'),
                        //   radius: 57,
                        // ),
                        SizedBox(
                          width: 17,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '₹$fourthprice',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                        // this is for total and price
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 90,
                                // height: 40,

                                child: TextField(
                                  controller: _fourthcontroller,
                                  onChanged: (value) {
                                    // pricing calculator
                                    try {
                                      if (value != '') {
                                        setState(() {
                                          fourthprice = (35 * int.parse(value));
                                        });
                                      } else {
                                        setState(() {
                                          fourthprice = 0;
                                        });
                                      }
                                    } catch (e) {
                                      e.toString();
                                    }
                                  },
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    counter: Offstage(),
                                    filled: true,
                                    fillColor: bgcolor2,
                                    hintText: 'ex 5',
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(11),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: bgcolor3,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 7,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Text(
                  'Price ₹${total()}',
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: majorButtonColor,
                  onPressed: () async {
                    if (finalprice != 0) {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookingScreen(
                                totalprice: finalprice,
                                can: fourthprice,
                                liter1: thredprice,
                                ml500: secondprice,
                                ml200: fristprice,
                              )));
                    } else {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                backgroundColor: Colors.red,
                                title: const Text(
                                  'Please select any product',
                                  style: TextStyle(color: Colors.white),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )));
                    }
                  },
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: const Center(
                      child: Text('Book Now',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
