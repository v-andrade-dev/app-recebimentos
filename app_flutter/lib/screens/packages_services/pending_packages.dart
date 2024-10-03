import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/screens/packages_services/packages_card.dart';
import 'package:flutter/material.dart';

class PendingPackages extends StatefulWidget {
  const PendingPackages({super.key});

  @override
  State<PendingPackages> createState() => _PendingPackagesState();
}

class _PendingPackagesState extends State<PendingPackages> {
  List<String> list = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            "Entregas Pendentes",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )),
      body: Column(
        children: getPackages(),
      ),
    );
  }

  List<Widget> getPackages() {
    List<Widget> list = [
      Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Container(
              decoration: BoxDecoration(color: AppColors.primary),
              child: ExpansionTile(
                title: Container(
                  child: Text("Item 1"),
                ),
                children: [
                  PackagesCard(
                      imageSource: "assets/images/closed2.png", title: "Titulo")
                ],
              ),
            ),
          )),
      Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Container(
              decoration: BoxDecoration(color: AppColors.primary),
              child: ExpansionTile(
                title: Container(
                  child: Text("Item 2"),
                ),
                children: [
                  PackagesCard(
                      imageSource: "assets/images/closed2.png", title: "Titulo")
                ],
              ),
            ),
          )),
    ];
    return list;
  }
}
