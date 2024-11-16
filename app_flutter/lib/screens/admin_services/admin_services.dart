import 'package:app_flutter/backend/injectable/injection.dart';
import 'package:app_flutter/backend/repositories/packagesRepo/packages.repo.dart';
import 'package:app_flutter/models/package.dart';
import 'package:app_flutter/resource/pending_packages_card.dart';
import 'package:app_flutter/screens/admin_services/admin_pending_packages.dart';
import 'package:app_flutter/screens/admin_services/new_package.dart';
import 'package:app_flutter/screens/admin_services/users_management.dart';
import 'package:app_flutter/screens/packages_services/packages_card.dart';
import 'package:flutter/material.dart';

class AdminServices extends StatefulWidget {
  const AdminServices({super.key});

  @override
  State<AdminServices> createState() => _AdminServicesState();
}

class _AdminServicesState extends State<AdminServices> {
  IPackagesRepo packagesRepo = getIt<IPackagesRepo>();
  List<Package> pendingPackages = [];

  DateTime date = DateTime.now();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: packagesRepo.getPredictedPackages(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            pendingPackages = snapshot.data!;
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                const Divider(),
                const Text("Entregas Programadas",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(date.toString()),
                SizedBox(
                  height: 250,
                  //width: MediaQuery.sizeOf(context).width,
                  child: SingleChildScrollView(
                      child: Column(
                    children: getPredictedPackages(),
                  )),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewPackage()));
                  },
                  child: const PackagesCard(
                    imageSource: "assets/images/icon.png",
                    title: "Nova Encomenda",
                    height: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UsersManagement()));
                  },
                  child: const PackagesCard(
                    imageSource: "assets/images/user.png",
                    title: "Gerenciar Usuários",
                    height: 50,
                  ),
                ),
                GestureDetector(
                  child: const PackagesCard(
                    imageSource: "assets/images/finish.png",
                    title: "Finalizar Entrega",
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminPendingPackages(
                                  packagesRepo: packagesRepo,
                                )));
                  },
                ),
              ]),
            );
          }
        }));
  }

  List<Widget> getPredictedPackages() {
    List<Widget> list = [];

    for (var element in pendingPackages) {
      list.add(PendingPackagesCard(
        package: element,
      ));
    }

    return list;
  }
}
