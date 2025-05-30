import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expriment/mongo_db.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

// List view builder page for status and history screen stream builder
class StatusList extends StatefulWidget {
  final snap;
  final userId;
  const StatusList({super.key, required this.snap, required this.userId});

  @override
  State<StatusList> createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  data() {
    var imestamp = widget.snap['date'];
    String formattedTime = DateFormat('hh:mm a').format(imestamp.toLocal());
    return formattedTime;
  }
//   data() {
//     Timestamp timestamp = widget.snap['date'];

// // Convert to 12-hour format time only
//     String formattedTime =
//         DateFormat('hh:mm a').format(timestamp.toDate().toLocal());
//     return formattedTime;
//   }

  @override
  void initState() {
    data();
    super.initState();
  }

  cancel(id, data) async {
    String res = 'somethingwrong';

    try {
      await Connector.cancelOrder(id, data);
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    print(res);
    return res;
  }

  TextStyle listStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    // return a widget
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        height: 175,
        decoration: BoxDecoration(
          color: statusbgcolor,
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${DateFormat.yMMMd().format(widget.snap['date'])}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  // For time
                  data(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                    '300ml      : ${(widget.snap['l1price'] / 250).toStringAsFixed(0)} bundle',
                    style: listStyle),
                const Spacer(
                  flex: 1,
                ),
                Text('₹${widget.snap['l1price']} ', style: listStyle),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                    '500ml      : ${(widget.snap['l2price'] / 250).toStringAsFixed(0)} bundle',
                    style: listStyle),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l2price']} ', style: listStyle),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                    '1L             : ${(widget.snap['l3price'] / 200).toStringAsFixed(0)} bundle',
                    style: listStyle),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l3price']} ', style: listStyle),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text(
                    '20L can   : ${(widget.snap['l4price'] / 35).toStringAsFixed(0)} can',
                    style: listStyle),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l4price']} ', style: listStyle),
              ],
            ),
            const Spacer(),
            Card(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Amount  :  ₹${widget.snap['finalprice']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onLongPress: () {
                        if (widget.snap['status'] == 'Pending' ||
                            widget.snap['status'] == 'Accepted') {
                          showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    content: const Text(
                                        'Do you want to CANCEL your order'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )),
                                      TextButton(
                                          onPressed: () async {
                                            await cancel(widget.snap['_id'],
                                                widget.snap);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ],
                                  )));
                        }
                      },
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            widget.snap['status'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: ((widget.snap['status'] ==
                                      'Pending') // delivered , congratulations your order placed successfully ,
                                  ? Colors.blue
                                  : (widget.snap['status'] == 'Accepted')
                                      ? Colors.green
                                      : (widget.snap['status'] == 'Delivered')
                                          ? const Color.fromARGB(
                                              255, 233, 5, 214)
                                          : Colors.red),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
