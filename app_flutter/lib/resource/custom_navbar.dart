import 'package:app_flutter/resource/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar(
      {super.key, required this.currentIndex, required this.setIndex});

  final int currentIndex;
  final Function(int) setIndex;

  void returnIndex(int index) {
    setIndex(index);
  }

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    index = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              widget.returnIndex(index);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notificações"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Opções")
          ],
          selectedItemColor: AppColors.black,
        ),
      ),
    );
  }
}
