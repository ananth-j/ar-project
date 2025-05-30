import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/cancelled.dart';
import '../pages/deliverd.dart';
import '../resourses/colors.dart';

class CanceldStreamWidget extends StatefulWidget {
  const CanceldStreamWidget({super.key});

  @override
  State<CanceldStreamWidget> createState() => _CanceldStreamWidgetState();
}

class _CanceldStreamWidgetState extends State<CanceldStreamWidget> {
  getData() async {
    return await Connector.getCanceldOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cancelled Orders',
            style: TextStyle(color: appbartextcolor),
          ),
          centerTitle: false,
          toolbarHeight: 50,
          backgroundColor: appbarbgcolor,
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      var id = snapshot.data[index]['_id'];
                      return CancelldOrdersWidget(snap: snapshot.data[index]);
                    }));
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 34, 156, 38),
                ));
              }
            }));
  }
}
