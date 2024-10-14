import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_appbar.dart';
import 'package:flutter/material.dart';

class UsersManagement extends StatefulWidget {
  const UsersManagement({super.key});

  @override
  State<UsersManagement> createState() => _UsersManagementState();
}

class _UsersManagementState extends State<UsersManagement> {
  List<String> residences = ["Casa 1", "Casa 2", "Casa 3"];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    dropdownValue = dropdownValue ?? residences.first;

    return Scaffold(
        appBar: const CustomAppBar(title: "Gerenciar Usuários"),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Residência:"),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items:
                      residences.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ]),
              const Divider(
                color: Colors.transparent,
              ),
              Text("Nome Completo:"),
              TextFormField(),
              const Divider(
                color: Colors.transparent,
              ),
              Text("CPF:"),
              TextFormField(),
              const Divider(
                color: Colors.transparent,
              ),
              Text("Email:"),
              TextFormField(),
              const Divider(
                color: Colors.transparent,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Salvar"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary),
                ),
              )
            ]),
          ),
        ));
  }
}
