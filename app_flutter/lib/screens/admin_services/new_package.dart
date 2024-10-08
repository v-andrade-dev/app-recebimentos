import 'package:flutter/material.dart';

class NewPackage extends StatefulWidget {
  const NewPackage({super.key});

  @override
  State<NewPackage> createState() => _NewPackageState();
}

class _NewPackageState extends State<NewPackage> {
  List<String> residences = ["Casa 1", "Casa 2", "Casa 3"];
  @override
  Widget build(BuildContext context) {
    String dropdownValue = residences.first;

    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Encomenda")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (value) {
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
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome Completo:"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
                    child: TextFormField(),
                  ),
                  Text("CPF:"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
                    child: TextFormField(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:
                        ElevatedButton(onPressed: () {}, child: Text("Enviar")),
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
