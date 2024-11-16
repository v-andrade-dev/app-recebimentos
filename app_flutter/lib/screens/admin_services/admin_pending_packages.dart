import 'package:app_flutter/backend/injectable/injection.dart';
import 'package:app_flutter/backend/repositories/packagesRepo/packages.repo.dart';
import 'package:app_flutter/backend/repositories/residences/residence.repo.dart';
import 'package:app_flutter/models/package.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:app_flutter/resource/custom_appbar.dart';
import 'package:app_flutter/resource/pending_packages_card.dart';
import 'package:flutter/material.dart';

class AdminPendingPackages extends StatefulWidget {
  const AdminPendingPackages({super.key, required this.packagesRepo});

  final IPackagesRepo packagesRepo;

  @override
  State<AdminPendingPackages> createState() => _AdminPendingPackagesState();
}

class _AdminPendingPackagesState extends State<AdminPendingPackages> {
  IResidenceRepo residenceRepo = getIt<IResidenceRepo>();
  IPackagesRepo packagesRepo = getIt<IPackagesRepo>();
  late Future getResidences;
  List<Package> pendingPackages = [];
  List<Residence> residences = [];
  Residence? residenceValue;

  @override
  void initState() {
    getResidences = residenceRepo.getResidences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Entregas Pendentes"),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: getResidences,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            residences = snapshot.data;
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Residência:"),
                  DropdownButton<Residence>(
                    value: residenceValue,
                    onChanged: (Residence? value) {
                      setState(() {
                        residenceValue = value!;
                      });
                    },
                    items: residences
                        .map<DropdownMenuItem<Residence>>((Residence value) {
                      return DropdownMenuItem<Residence>(
                        value: value,
                        child: Text(value.number.toString()),
                      );
                    }).toList(),
                  ),
                  if (residenceValue != null)
                    FutureBuilder(
                        future: packagesRepo
                            .getPackageByResidenceID(residenceValue!.id!),
                        builder: ((context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Erro: ${snapshot.error}');
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            pendingPackages = snapshot.data!;
                            return SizedBox(
                              height: MediaQuery.sizeOf(context).height / 2,
                              //width: 300,
                              child: SingleChildScrollView(
                                  child: Column(
                                children: getPendingPackages(),
                              )),
                            );
                          }
                        }))
                ],
              ),
            );
          }
        }),
      )),
    );
  }

  List<Widget> getPendingPackages() {
    List<Widget> list = [];

    for (var element in pendingPackages) {
      list.add(PendingPackagesCard(
        package: element,
        finish: true,
      ));
    }

    return list;
  }
}
