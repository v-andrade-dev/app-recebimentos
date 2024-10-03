import 'package:app_flutter/screens/packages_services/packages_card.dart';
import 'package:app_flutter/screens/packages_services/pending_packages.dart';
import 'package:flutter/material.dart';

class AdminServices extends StatefulWidget {
  const AdminServices({super.key});

  @override
  State<AdminServices> createState() => _AdminServicesState();
}

class _AdminServicesState extends State<AdminServices> {
  @override
  Widget build(BuildContext context) {
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
          const Text("Não há entregas pendentes."),
          const Divider(),
          Column(children: [
            GestureDetector(
              onTap: () {},
              child: const PackagesCard(
                imageSource: "assets/images/closed2.png",
                title: "Nova Encomenda",
              ),
            ),
            GestureDetector(
              child: const PackagesCard(
                imageSource: "assets/images/open2.png",
                title: "Novo Usuário",
              ),
            ),
          ]),
          GestureDetector(
            child: const PackagesCard(
              imageSource: "assets/images/closed2.png",
              title: "Entregas Pendentes",
            ),
          ),
          GestureDetector(
            child: const PackagesCard(
              imageSource: "assets/images/open2.png",
              title: "Entregas Finalizadas",
            ),
          ),
        ]));
  }
}
