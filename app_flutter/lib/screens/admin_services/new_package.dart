import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

class NewPackage extends StatefulWidget {
  const NewPackage({super.key});

  @override
  State<NewPackage> createState() => _NewPackageState();
}

class _NewPackageState extends State<NewPackage> {
  List<String> residences = ["Casa 1", "Casa 2", "Casa 3"];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    dropdownValue = dropdownValue ?? residences.first;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cadastrar Encomenda",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
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
              const Divider(
                color: Colors.transparent,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Destinatário:"),
                  TextFormField(),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text("Remetente:"),
                  TextFormField(),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Data de entrada:"),
                          DateTimeField(
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100),
                              );
                            },
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Salvar"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
