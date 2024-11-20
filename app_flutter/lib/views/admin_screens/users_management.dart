import 'package:app_flutter/backend/config/injectable/injection.dart';
import 'package:app_flutter/backend/data/repositories/owner/owner.repo.dart';
import 'package:app_flutter/models/owner.dart';
import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/widgets/custom_appbar.dart';
import 'package:app_flutter/views/admin_screens/user_data.dart';
import 'package:flutter/material.dart';

class UsersManagement extends StatefulWidget {
  const UsersManagement({super.key});

  @override
  State<UsersManagement> createState() => _UsersManagementState();
}

class _UsersManagementState extends State<UsersManagement> {
  IOwnerRepo ownerRepo = getIt<IOwnerRepo>();
  late Future getOwners;
  Owner? owner;
  bool? newOwner;

  @override
  void initState() {
    super.initState();
    getOwners = ownerRepo.getOwners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Gerenciar Usuários"),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: getOwners,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.connectionState != ConnectionState.done) {
                return const Text('Nenhum usuário encontrado');
              }
              List<Owner> owners = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(24),
                child: Column(children: [
                  Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text("Usuário:"),
                              ),
                              if (newOwner != true)
                                DropdownButton<Owner>(
                                  value: owner,
                                  onChanged: (Owner? value) {
                                    setState(() {
                                      newOwner = false;
                                      owner = value!;
                                    });
                                  },
                                  items: owners.map<DropdownMenuItem<Owner>>(
                                      (Owner value) {
                                    return DropdownMenuItem<Owner>(
                                        value: value,
                                        child: Text(value.name ?? ""));
                                  }).toList(),
                                ),
                            ]),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              newOwner = true;
                              owner = Owner.empty();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary),
                            child: const Text(
                              "Novo",
                              style: TextStyle(color: AppColors.neutral),
                            ),
                          ),
                        ]),
                  ),
                  if (newOwner != null)
                    UserData(
                      owner: owner!,
                      newOwner: newOwner!,
                      ownerRepo: ownerRepo,
                    )
                ]),
              );
            }),
          ),
        ));
  }

  Widget showUserData(Owner owner, bool newOwner) {
    return UserData(
      owner: owner,
      newOwner: newOwner,
      ownerRepo: ownerRepo,
    );
  }
}
