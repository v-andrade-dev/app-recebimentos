import 'package:app_flutter/views/common/menu_card.dart';
import 'package:app_flutter/views/owner_screens/pending_packages.dart';
import 'package:flutter/material.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.now().toLocal();
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 64, 24, 16),
        child: Column(children: [
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Olá, ",
                style: TextStyle(fontSize: 24),
              )),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Usuário ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
          const Text("Avisos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          //Text("${data.day} / ${data.month}"),
          const Text("Não há entregas pendentes."),
          const Divider(),
          Column(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PendingPackages()));
              },
              child: const MenuCard(
                imageSource: "assets/images/closed2.png",
                title: "Entregas Pendentes",
                //width: 200,
              ),
            ),
            GestureDetector(
              child: const MenuCard(
                imageSource: "assets/images/open2.png",
                title: "Entregas Recebidas",
                //width: 100,
                //height: 100,
              ),
            ),
          ]),
          GestureDetector(
            child: const MenuCard(
              imageSource: "assets/images/delivery2.png",
              title: "Agendar Entrega",
              //width: 100,
              //height: 100,
            ),
          ),
        ]));
  }
}