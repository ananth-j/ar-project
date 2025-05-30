import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  TextStyle listStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    // return a widget
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
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
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  // For time
                  data(),
                  style: const TextStyle(
                     fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                    '300ml      : ${(widget.snap['l1price'] / 250).toStringAsFixed(0)} bundle',
                    style: listStyle),
                const Spacer(
                  flex: 1,
                ),
                Text('₹ ${widget.snap['l1price']} ', style: listStyle),
              ],
            ),
            // const SizedBox(
            //   height: 3,
            // ),
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
            const SizedBox(
              height: 7,
            ),
            Card(
              color: const Color.fromARGB(255, 230, 240, 245),
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      'Total Amount   ₹${widget.snap['finalprice']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
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
                                    ? const Color.fromARGB(255, 233, 5, 214)
                                    : Colors.red),
                      ),
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
