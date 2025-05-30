import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';

import '../resourses/colors.dart';

class CancelldOrdersWidget extends StatefulWidget {
  final snap;
  const CancelldOrdersWidget({super.key, required this.snap});

  @override
  State<CancelldOrdersWidget> createState() => _CancelldOrdersWidgetState();
}

class _CancelldOrdersWidgetState extends State<CancelldOrdersWidget> {
  dialer(number) async {
    try {
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    } catch (e) {
      print(e.toString());
    }
  }

  data() {
    var imestamp = widget.snap['date'];
    String formattedTime = DateFormat('hh:mm a').format(imestamp.toLocal());
    return formattedTime;
  }

  @override
  void initState() {
    data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          // height: 302,
          width: double.infinity,
          decoration: BoxDecoration(
            color: listcolor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(4),
                  height: 35,
                  child: Row(
                    children: [
                      Text(
                        DateFormat.yMMMd().format(widget.snap['date']),
                        style: datefont,
                      ),
                      const Spacer(),
                      Text(
                        data(),
                        style: datefont,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              '300ml      : ${(widget.snap['l1price'] / 250).toStringAsFixed(0)} bundle'),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('₹ ${widget.snap['l1price']}'),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                              '500ml      : ${(widget.snap['l2price'] / 250).toStringAsFixed(0)} bundle'),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('₹ ${widget.snap['l2price']} '),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                              '1L            : ${(widget.snap['l3price'] / 200).toStringAsFixed(0)} bundle'),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('₹ ${widget.snap['l3price']} '),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          const Text('20L can'),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                              ': ${(widget.snap['l4price'] / 35).toStringAsFixed(0)} can'),
                          const Spacer(
                            flex: 1,
                          ),
                          Text('₹ ${widget.snap['l4price']} '),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            content: Card(
                              elevation: 0,
                              child: Container(
                                // height:
                                // MediaQuery.of(context).size.height * 0.2,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Phone  No :  ${widget.snap['phone']}',
                                      style: dialogboxphone,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '${widget.snap['address']}',
                                      style: dialogboxphone,
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: MaterialButton(
                                          color: Colors.blue,
                                          onPressed: () {
                                            dialer(widget.snap['phone']);
                                          },
                                          child: Icon(
                                            Icons.call,
                                            color: Colors.white,
                                          )),
                                    ),
                                    // const Spacer(
                                    //   flex: 5,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          )));
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          '${widget.snap['name']}',
                          style: namefont,
                        ),
                        Text(
                          'Amount  :  ₹${widget.snap['finalprice']}',
                          style: datefont,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
