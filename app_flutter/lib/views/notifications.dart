import 'package:app_flutter/resource/widgets/custom_appbar.dart';
import 'package:app_flutter/resource/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> list = ["Item 1", "Item 2", "Item 3", "Item 4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Notificações",
        backArrow: false,
      ),
      body: Container(
        //decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.3)),
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return CustomCard(
              title: "Titulo",
              message: list[index].toString(),
            );
          }),
        ),
      ),
    );
  }
}
