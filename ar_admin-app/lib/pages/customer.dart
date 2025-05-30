import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';

import '../db.dart';
import '../streames/status_stream_screen.dart';

class CustomersList extends StatelessWidget {
  final data;
  final id;
  const CustomersList({super.key, required this.data, required this.id});
  dialer(number) async {
    try {
      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('rrrrr${data['uid']}');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StatusScreen(
                  id: data['uid'],
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(2)),
              height: 140,
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Name'),
                      const SizedBox(
                        width: 26,
                      ),
                      const Text(': '),
                      Flexible(child: Text('${data['username']}')),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text('Phone'),
                      const SizedBox(
                        width: 23,
                      ),
                      const Text(': '),
                      Text(' ${data['phone']}'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Address'),
                      const SizedBox(
                        width: 11,
                      ),
                      const Text(': '),
                      Flexible(child: Text('${data['address']}')),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text('Date          :'),
                      Text(' ${DateFormat.yMMMd().format(data['jion_date'])}'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text('Status       :'),
                      Text(
                        '  ${data['status']}',
                        style: TextStyle(
                            color: data['status'] == 'Allowed'
                                ? Colors.green
                                : Colors.red),
                      ), // ${data['cus_status']}
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: PopupMenuButton(
                  splashRadius: 1,
                  itemBuilder: ((context) => const [
                        PopupMenuItem(
                          value: 1,
                          child: Text('Block'),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Text('Unblock'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Call'),
                        )
                      ]),
                  onSelected: (value) {
                    if (value == 1) {
                      Connector.bolckCustomer(id, data);
                      print(id);
                    }
                    if (value == 3) {
                      Connector.unBlockCustomer(id, data);
                    }
                    if (value == 2) {
                      dialer(data['phone']);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
