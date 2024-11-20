import 'package:app_flutter/backend/config/injectable/injection.dart';
import 'package:app_flutter/backend/data/repositories/packagesRepo/packages.repo.dart';
import 'package:app_flutter/backend/data/repositories/residences/residence.repo.dart';
import 'package:app_flutter/models/package.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/widgets/app_confimation_dialog.dart';
import 'package:app_flutter/resource/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

class NewPackage extends StatefulWidget {
  const NewPackage({super.key});

  @override
  State<NewPackage> createState() => _NewPackageState();
}

class _NewPackageState extends State<NewPackage> {
  IResidenceRepo residenceRepo = getIt<IResidenceRepo>();
  IPackagesRepo packagesRepo = getIt<IPackagesRepo>();
  late Future getResidences;
  List<Residence> residences = [];
  Residence? residenceValue;
  Package? package = Package.empty();

  @override
  void initState() {
    super.initState();
    getResidences = residenceRepo.getResidences();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cadastrar Encomenda",
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: getResidences,
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  residences = snapshot.data;
                  return Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Residência:"),
                        DropdownButton<Residence>(
                          value: residenceValue,
                          onChanged: (value) {
                            setState(() {
                              residenceValue = value!;
                              package?.residence = residenceValue;
                            });
                          },
                          items: residences.map<DropdownMenuItem<Residence>>(
                              (Residence value) {
                            return DropdownMenuItem<Residence>(
                              value: value,
                              child: Text(value.number.toString()),
                            );
                          }).toList(),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Destinatário:"),
                            TextFormField(
                              onChanged: (value) => package?.ownerName = value,
                            ),
                            const Divider(
                              color: Colors.transparent,
                            ),
                            const Text("Remetente:"),
                            TextFormField(
                              onChanged: (value) => package?.shipper = value,
                            ),
                            const Divider(
                              color: Colors.transparent,
                            ),
                            SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Data de entrada:"),
                                    DateTimeField(
                                      format: format,
                                      onShowPicker:
                                          (context, currentValue) async {
                                        return await showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                initialDate: currentValue ??
                                                    DateTime.now(),
                                                lastDate: DateTime(2100))
                                            .then((DateTime? date) async {
                                          if (date != null) {
                                            currentValue = date;
                                            package?.entryDate = date;
                                          }
                                          return currentValue;
                                        });
                                      },
                                    ),
                                  ],
                                )),
                            Align(
                              alignment: Alignment.topRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (package?.residence != null &&
                                      package?.ownerName != null &&
                                      package?.shipper != null &&
                                      package?.entryDate != null) {
                                    AppConfimationDialog.runTaskSucessOrError(
                                        context, () async {
                                      return await packagesRepo
                                          .savePackages(package!);
                                    });
                                    debugPrint(package.toString());
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.secondary),
                                child: const Text(
                                  "Salvar",
                                  style: TextStyle(color: AppColors.neutral),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
              }))),
    );
  }
}
