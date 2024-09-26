import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_navbar.dart';
import 'package:app_flutter/screens/notifications.dart';
import 'package:app_flutter/screens/options.dart';
import 'package:app_flutter/screens/packages_services/user_services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _tabs = [
    UserServices(),
    Notifications(),
    Options(),
  ];

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