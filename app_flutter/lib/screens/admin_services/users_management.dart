import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_appbar.dart';
import 'package:app_flutter/screens/admin_services/user_data.dart';
import 'package:flutter/material.dart';

class UsersManagement extends StatefulWidget {
  const UsersManagement({super.key});

  @override
  State<UsersManagement> createState() => _UsersManagementState();
}

class _UsersManagementState extends State<UsersManagement> {
  List<String> users = ["Usuario 1", "Usuario 2", "Usuario 3"];
  String? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Gerenciar Usuários"),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(children: [
            Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text("Usuário:"),
                        ),
                        DropdownButton<String>(
                          value: user,
                          onChanged: (String? value) {
                            setState(() {
                              user = value!;
                            });
                          },
                          items: users
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Novo"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary),
                    ),
                  ]),
            ),
            if (user != null) UserData()
          ]),
        )));
  }
}
