import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/status_list.dart';
import '../resourses/colors.dart';

class StatusScreen extends StatefulWidget {
  final id;
  const StatusScreen({super.key, required this.id});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  int totalorder = 0;
  var recevedData;
  getOrderHistory() async {
    recevedData = await Connector.getCustomersOrderHistory(widget.id);

    // print('kkkkkkkkkkk${recevedData}');
    try {
      setState(() {
        totalorder = recevedData.length;
      });
    } catch (e) {
      print(e.toString());
    }
    //  print('aaaaaaaaaaaa${recevedData}');

    return recevedData;
  }

  deleteHistory() async {
    await Connector.deleteCustomerOrderHistory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            '${totalorder} Orders',
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  deleteHistory();
                },
                icon: const Icon(Icons.delete)),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: appbarbgcolor,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getOrderHistory(),
                  builder: (context, AsyncSnapshot snapshot) {
                    print(snapshot);
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) => StatusList(
                          snap: snapshot.data[index],
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  }),
            ),
          ],
        ));
  }
}
