import 'package:app_flutter/resource/app_colors.dart';
import 'package:flutter/material.dart';

class PendingPackagesCard extends StatelessWidget {
  const PendingPackagesCard(
      {super.key,
      required this.owner,
      required this.shipper,
      required this.residence,
      this.predictedDate});

  final String shipper;
  final String owner;
  final String residence;
  final DateTime? predictedDate;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          "Residencia: $residence - $owner",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Column(children: [
            Text(
              "Remetente: $shipper",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (predictedDate != null)
              Text(
                "Previsto: $predictedDate",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Receber",
                  style: TextStyle(color: AppColors.secondary),
                )),
          ])
        ],
      ),
    );
  }
}
