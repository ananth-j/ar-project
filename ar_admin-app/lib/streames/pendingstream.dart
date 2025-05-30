import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/pending.dart';
import '../resourses/colors.dart';

class PendingStreamWidget extends StatefulWidget {
  const PendingStreamWidget({super.key});

  @override
  State<PendingStreamWidget> createState() => _PendingStreamWidgetState();
}

class _PendingStreamWidgetState extends State<PendingStreamWidget> {
  int totalorder = 0;
  var recevedData;
  getData() async {
    recevedData = await Connector.getPendingOrders();
    try {
      setState(() {
        totalorder = recevedData.length;
      });
    } catch (e) {
      print(e.toString());
    }
    return recevedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${totalorder} Pending Orders',
            style: const TextStyle(color: appbartextcolor),
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
                      return Pending(snap: snapshot.data[index], id: id);
                    }));
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 34, 156, 38),
                ));
              }
            }));
  }
}
