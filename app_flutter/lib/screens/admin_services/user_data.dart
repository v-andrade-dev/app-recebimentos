import 'package:app_flutter/resource/app_colors.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  List<String> residences = ["Casa 1", "Casa 2", "Casa 3"];
  String? residenceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Residência:"),
        DropdownButton<String>(
          value: residenceValue,
          onChanged: (String? value) {
            setState(() {
              residenceValue = value!;
            });
          },
          items: residences.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
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
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
          ),
        )
      ]),
    );
  }
}
