import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/new_orders.dart';
import '../resourses/colors.dart';

class NewStreamWidget extends StatefulWidget {
  const NewStreamWidget({super.key});

  @override
  State<NewStreamWidget> createState() => _NewStreamWidgetState();
}

class _NewStreamWidgetState extends State<NewStreamWidget> {
  int totalorder = 0;
  var recevedData;
  getData() async {
    recevedData = await Connector.getNewOrders();
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
            '${totalorder} New Orders ',
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
                      return NewOrders(snap: snapshot.data[index], id: id);
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
