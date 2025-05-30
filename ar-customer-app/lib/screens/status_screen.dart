import 'package:expriment/mongo_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/status_list.dart';
import '../utils/colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/user_provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> getOrderHistory() async {
    var data;
    data = await Connector.getOrderHistory(_auth.currentUser!.uid);
    return data;
  }

  // @override
  // void initState() async {
  //   await getOrderHistory();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: finalbgcolor,
        appBar: AppBar(
          title: const Text(
            'Status & History',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: finalbgcolor,
        ),
        body: FutureBuilder(
            future: getOrderHistory(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, index) => StatusList(
                  snap: snapshot.data![index],
                  userId: _auth.currentUser!.uid,
                ),
              );
            }));
  }
}
