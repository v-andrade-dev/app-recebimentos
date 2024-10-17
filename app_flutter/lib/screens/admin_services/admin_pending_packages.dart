import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_appbar.dart';
import 'package:flutter/material.dart';

class AdminPendingPackages extends StatefulWidget {
  const AdminPendingPackages({super.key});

  @override
  State<AdminPendingPackages> createState() => _AdminPendingPackagesState();
}

class _AdminPendingPackagesState extends State<AdminPendingPackages> {
  List<String> agendadas = [
    "Entrega Programada 1",
    "Entrega Programada 2",
    "Entrega Programada 3",
  ];
  List<String> residences = ["Casa 1", "Casa 2", "Casa 3"];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Entregas Pendentes"),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Residência:"),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: residences.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (dropdownValue != null)
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
                //width: 300,
                child: SingleChildScrollView(
                    child: Column(
                  children: getScheduled(),
                )),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> getScheduled() {
    List<Widget> list = [];

    for (var element in agendadas) {
      list.add(
        SizedBox(
            child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Text(
                    "Remetente: Amazon - Previsto: 15/10/2024",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Destinatario: Usuario - Residencia: Casa 1")
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Receber",
                    style: TextStyle(color: AppColors.secondary),
                  ))
            ],
          ),
        )),
      );
    }

    return list;
  }
}
