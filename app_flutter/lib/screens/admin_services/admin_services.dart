import 'package:app_flutter/screens/admin_services/new_package.dart';
import 'package:app_flutter/screens/packages_services/packages_card.dart';
import 'package:app_flutter/screens/packages_services/pending_packages.dart';
import 'package:flutter/material.dart';

class AdminServices extends StatefulWidget {
  const AdminServices({super.key});

  @override
  State<AdminServices> createState() => _AdminServicesState();
}

class _AdminServicesState extends State<AdminServices> {
  List<String> agendadas = [
    "Entrega Programada 1",
    "Entrega Programada 2",
    "Entrega Programada 3",
    "Entrega Programada 4",
    "Entrega Programada 5",
    "Entrega Programada 6"
  ];

  DateTime date = DateTime.now();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height,
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
          const Divider(),
          const Text("Entregas Programadas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(date.toString()),
          SizedBox(
            height: 250,
            width: 300,
            child: SingleChildScrollView(
                child: Column(
              children: getScheduled(),
            )),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewPackage()));
            },
            child: const PackagesCard(
              imageSource: "assets/images/icon.png",
              title: "Nova Encomenda",
              height: 50,
            ),
          ),
          GestureDetector(
            child: const PackagesCard(
              imageSource: "assets/images/user.png",
              title: "Gerenciar Usuários",
              height: 50,
            ),
          ),
          GestureDetector(
            child: const PackagesCard(
              imageSource: "assets/images/finish.png",
              title: "Entregas Finalizadas",
              height: 50,
            ),
          ),
        ]));
  }

  List<Widget> getScheduled() {
    List<Widget> list = [];

    for (var element in agendadas) {
      list.add(ListTile(title: (Text(element))));
    }

    return list;
  }
}
