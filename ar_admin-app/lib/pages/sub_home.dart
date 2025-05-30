import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../resourses/colors.dart';
import '../streames/canceld_srteam.dart';
import '../streames/customer_stream.dart';
import '../streames/deliveredstream.dart';
import '../streames/neworders.dart';
import '../streames/pendingstream.dart';
import '../streames/rejectedstream.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Admin Panel')),
        backgroundColor: appbarbgcolor,
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.end, //  mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GridView(
              //   scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const NewStreamWidget())));
                    },
                    child: const Center(
                      child: Text(
                        '  New\nOrders',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const PendingStreamWidget())));
                    },
                    child: const Center(
                      child: Text(
                        'Pending\n Orders',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>
                              const DeliveredStreamWidget())));
                    },
                    child: const Center(
                      child: Text(
                        'Delivered\n  Orders',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>
                              const RejectedStreamWidget())));
                    },
                    child: const Center(
                      child: Text(
                        'Rejected\n Orders',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const CanceldStreamWidget())));
                    },
                    child: const Center(
                      child: Text(
                        'Canceld\n Orders',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const CustomerStream())));
                    },
                    child: const Center(
                      child: Text(
                        'Customer\n     List',
                        style: TextStyle(
                            color: buttonColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
