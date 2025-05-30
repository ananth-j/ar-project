import 'package:ar_admin/pages/sub_home.dart';
import 'package:flutter/material.dart';

import 'db.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool conect = true;
  callConnector() async {
    conect = true;
    await Connector.connect();
    setState(() {
      conect = false;
    });
  }

  @override
  void initState() {
    callConnector();
    //Xdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: conect
          ? const Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Connecting to Server',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          : MainHomeScreen(),
    );
  }
}
//MainHomeScreen
