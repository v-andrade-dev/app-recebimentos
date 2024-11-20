import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/widgets/custom_navbar.dart';
import 'package:app_flutter/views/admin_screens/admin_home.dart';
import 'package:app_flutter/views/notifications.dart';
import 'package:app_flutter/views/options.dart';
import 'package:app_flutter/views/owner_screens/owner_home.dart';
import 'package:flutter/material.dart';

enum Users { admin, owner }

class Home extends StatefulWidget {
  const Home({super.key, this.user = Users.admin});

  final Users user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
    _tabs = getTabs();
  }

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              decoration: const BoxDecoration(color: AppColors.neutral),
              height: MediaQuery.sizeOf(context).height,
              child: _tabs[_currentIndex]),
        ])),
        bottomNavigationBar:
            CustomNavBar(currentIndex: _currentIndex, setIndex: changeIndex));
  }

  List<Widget> getTabs() {
    List<Widget> list = [];
    list.add(
        widget.user == Users.admin ? const AdminHome() : const OwnerHome());
    list.add(const Notifications());
    list.add(const Options());

    return list;
  }
}
