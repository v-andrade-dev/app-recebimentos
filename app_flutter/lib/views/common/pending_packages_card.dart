import 'package:app_flutter/models/package.dart';
import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/views/admin_screens/finish_package.dart';
import 'package:flutter/material.dart';

class PendingPackagesCard extends StatelessWidget {
  const PendingPackagesCard({super.key, required this.package, this.finish});

  final Package package;
  final bool? finish;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          "Residencia: ${package.residence!.number.toString()} - ${package.ownerName}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Column(children: [
            Text(
              "Remetente: ${package.shipper}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              finish == true
                  ? "Data de entrada: ${package.entryDate}"
                  : "Previsto: ${package.predictedDate}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  if (finish == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinishPackage(
                                  package: package,
                                )));
                  }
                },
                child: Text(
                  finish != true ? "Receber" : "Finalizar",
                  style: const TextStyle(color: AppColors.secondary),
                )),
          ])
        ],
      ),
    );
  }
}
