import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/widgets/custom_appbar.dart';
import 'package:app_flutter/views/common/menu_card.dart';
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
      appBar: const CustomAppBar(
        title: "Entregas Pendentes",
      ),
      body: Column(
        children: getPackages(),
      ),
    );
  }

  List<Widget> getPackages() {
    List<Widget> list = [
      const Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: ExpansionTile(
              title: Text("Item 1"),
              children: [
                MenuCard(
                    imageSource: "assets/images/closed2.png", title: "Titulo")
              ],
            ),
          )),
      Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            child: Container(
              decoration: const BoxDecoration(color: AppColors.primary),
              child: const ExpansionTile(
                title: Text("Item 2"),
                children: [
                  MenuCard(
                      imageSource: "assets/images/closed2.png", title: "Titulo")
                ],
              ),
            ),
          )),
    ];
    return list;
  }
}
