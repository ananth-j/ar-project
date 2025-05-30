import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/user_provider.dart';
import '../widgets/bottom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pagecontroller;
  var _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    addData();
    _currentIndex = 0;
    pagecontroller = PageController();
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  void navigator(int page) {
    pagecontroller.jumpToPage(page);
  }

  // this is for change page from booking screen
  pagechanger() {
    pagecontroller.jumpToPage(1);
  }

  void _onPageChanged(int index) {
    pagecontroller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  addData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: pagecontroller,
        physics: const NeverScrollableScrollPhysics(),
        children: homescreenitems,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: color3,
                offset: Offset.fromDirection(3, 1),
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.fire_truck), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          currentIndex: _currentIndex,
          unselectedIconTheme: const IconThemeData(color: color2, size: 20),
          selectedIconTheme: const IconThemeData(color: color1, size: 24),
          onTap: _onPageChanged,
          type: BottomNavigationBarType.fixed,
          backgroundColor: bgcolor4,
        ),
      ),
    );
  }
}
