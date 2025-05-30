import 'package:flutter/material.dart';

import '../db.dart';
import '../pages/customer.dart';
import '../pages/deliverd.dart';
import '../resourses/colors.dart';

class CustomerStream extends StatefulWidget {
  const CustomerStream({super.key});

  @override
  State<CustomerStream> createState() => _CustomerStreamState();
}

class _CustomerStreamState extends State<CustomerStream> {
  int totalorder = 0;
  var recevedData;
  String sreachKey = '';
  getData() async {
    recevedData = await Connector.getCustomers();
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                //width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${totalorder} Customers',
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            sreachKey = value;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 10, right: 5, bottom: 0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.7)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: getData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            //shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: ((context, index) {
                              var Xdata = snapshot.data[index]['username'];
                              var phone = snapshot.data[index]['phone'];
                              var id = snapshot.data[index]['_id'];
                              if (sreachKey.isEmpty) {
                                return CustomersList(
                                    data: snapshot.data[index], id: id);
                              }
                              if (Xdata.toLowerCase()
                                  .contains(sreachKey.toLowerCase())) {
                                return CustomersList(
                                    data: snapshot.data[index], id: id);
                              }
                              return Container();
                            }));
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: const Color.fromARGB(255, 34, 156, 38),
                        ));
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
