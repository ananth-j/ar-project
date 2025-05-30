import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/deliverd.dart';

import '../resourses/colors.dart';

class DeliveredStreamWidget extends StatefulWidget {
  const DeliveredStreamWidget({super.key});

  @override
  State<DeliveredStreamWidget> createState() => _DeliveredStreamWidgetState();
}

class _DeliveredStreamWidgetState extends State<DeliveredStreamWidget> {
  getData() async {
    return await Connector.getDeliverdOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Delivered Orders',
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
                      return Deliverd(snap: snapshot.data[index], id: id);
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
