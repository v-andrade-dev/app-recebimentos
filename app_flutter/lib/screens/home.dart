import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_navbar.dart';
import 'package:app_flutter/screens/notifications.dart';
import 'package:app_flutter/screens/options.dart';
import 'package:app_flutter/screens/packages_services/admin_services.dart';
import 'package:app_flutter/screens/packages_services/owner_services.dart';
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
        body: Container(
          child: _tabs[_currentIndex],
        ),
        bottomNavigationBar:
            CustomNavBar(currentIndex: _currentIndex, setIndex: changeIndex));
  }

  List<Widget> getTabs() {
    List<Widget> list = [];
    list.add(widget.user == Users.admin ? AdminServices() : OwnerServices());
    list.add(Notifications());
    list.add(Options());

    return list;
  }
}


/*

Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primary,
              currentIndex: _currentIndex,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "Notificações"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Opções")
              ],
              selectedItemColor: AppColors.black,
            ),
          ),
        )

*/
