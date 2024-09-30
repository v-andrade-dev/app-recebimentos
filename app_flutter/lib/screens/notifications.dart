import 'package:app_flutter/resource/app_colors.dart';
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
      appBar: AppBar(
        title: const Text(
          "Notificações",
        ),
        backgroundColor: AppColors.secondary,
      ),
      body: Container(
        //decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.3)),
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: Card(
                  //color: AppColors.primary.withOpacity(0.3),
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  height: 50,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Titulo"),
                        Text(
                          list[index].toString(),
                        ),
                      ]),
                ),
              )),
            );
          }),
        ),
      ),
    );
  }
}
