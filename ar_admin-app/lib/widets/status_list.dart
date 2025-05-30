import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resourses/colors.dart';

// List view builder page for status and history screen stream builder
class StatusList extends StatefulWidget {
  final snap;
  const StatusList({super.key, required this.snap});

  @override
  State<StatusList> createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
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
    // return a widget
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          color: statusbgcolor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  // For Date
                  DateFormat.yMMMd().format(widget.snap['date'].toDate()),
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  // For time
                  data(),
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                    '300ml      : ${(widget.snap['l1price'] / 250).toStringAsFixed(0)} bundle'),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l1price']} '),
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
                    '1L             : ${(widget.snap['l3price'] / 200).toStringAsFixed(0)} bundle'),
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
                Text(
                    '20L can   : ${(widget.snap['l4price'] / 35).toStringAsFixed(0)} can'),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l4price']} '),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Amount  :  ₹${widget.snap['finalprice']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17),
                ),
                const Spacer(
                  flex: 1,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      widget.snap['status'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: ((widget.snap['status'] ==
                                'Pending') // delivered , congratulations your order placed successfully ,
                            ? Colors.blue
                            : (widget.snap['status'] == 'Accepted')
                                ? Colors.green
                                : (widget.snap['status'] == 'Delivered')
                                    ? const Color.fromARGB(255, 233, 5, 214)
                                    : Colors.red),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
