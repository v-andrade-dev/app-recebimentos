import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/screens/packages_services/packages_card.dart';
import 'package:flutter/material.dart';

class UserServices extends StatelessWidget {
  const UserServices({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.now().toLocal();
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Avisos",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            Text("${data.day} / ${data.month}"),
            Text("Não há novas entregas pendentes."),
            GestureDetector(
              child: PackagesCard(
                imageSource: "assets/images/close.png",
                title: "Entregas Pendentes",
              ),
            ),
            GestureDetector(
              child: PackagesCard(
                imageSource: "assets/images/open.png",
                title: "Entregas Recebidas",
                width: 100,
                height: 100,
              ),
            ),
            GestureDetector(
              child: PackagesCard(
                imageSource: "assets/images/futurePackage.png",
                title: "Agendar Entrega",
                width: 100,
                height: 100,
              ),
            )
          ],
        ));
  }
}
