import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/rejected.dart';
import '../resourses/colors.dart';

class RejectedStreamWidget extends StatefulWidget {
  const RejectedStreamWidget({super.key});

  @override
  State<RejectedStreamWidget> createState() => _RejectedStreamWidgetState();
}

class _RejectedStreamWidgetState extends State<RejectedStreamWidget> {
  getData() async {
    return await Connector.getRejectedOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rejected Orders',
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
                print('ddd${snapshot.data.length}');
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      var id = snapshot.data[index]['_id'];
                      return Rejectded(snap: snapshot.data[index], id: id);
                    }));
              } else {
                return const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255, 34, 156, 38),));
              }
            }));
  }
}
