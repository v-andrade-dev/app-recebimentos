import 'package:app_flutter/backend/config/injectable/injection.dart';
import 'package:app_flutter/backend/data/repositories/owner/owner.repo.dart';
import 'package:app_flutter/backend/data/repositories/residences/residence.repo.dart';
import 'package:app_flutter/models/owner.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:app_flutter/resource/app_colors.dart';
import 'package:app_flutter/resource/widgets/app_confimation_dialog.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData(
      {super.key,
      required this.owner,
      required this.newOwner,
      required this.ownerRepo});

  final Owner owner;
  final bool newOwner;
  final IOwnerRepo ownerRepo;
  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  IResidenceRepo residenceRepo = getIt<IResidenceRepo>();
  Future? getResidences;
  Residence? residenceValue;
  Owner? selectedOwner;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getResidences = residenceRepo.getResidences();
  }

  @override
  Widget build(BuildContext context) {
    selectedOwner = widget.owner;
    return FutureBuilder(
        future: getResidences,
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            List<Residence> residences = snapshot.data!;
            return Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Residencia"),
                        if (widget.newOwner == true)
                          selectResidences(residences),
                        if (selectedOwner?.id != null)
                          TextFormField(
                            enabled: false,
                            controller: TextEditingController(
                                text:
                                    widget.owner.residence!.number.toString()),
                          ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor digite um nome valido.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            selectedOwner?.name = value;
                          },
                          controller: TextEditingController(
                              text: selectedOwner?.name ?? ""),
                          decoration:
                              const InputDecoration(label: Text("Nome")),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor digite um cpf valido.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            selectedOwner?.document = value;
                          },
                          controller: TextEditingController(
                              text: selectedOwner?.document ?? ""),
                          decoration: const InputDecoration(label: Text("CPF")),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "O campo email é obrigatorio";
                            }
                            if (!value.contains("@")) {
                              return "Por favor digite um email valido.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            selectedOwner?.email = value;
                          },
                          controller: TextEditingController(
                              text: selectedOwner?.email ?? ""),
                          decoration:
                              const InputDecoration(label: Text("Email")),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            onPressed: () {
                              selectedOwner?.residence = residenceValue;
                              if (_formKey.currentState!.validate()) {
                                AppConfimationDialog.runTaskSucessOrError(
                                    context, () async {
                                  return await widget.ownerRepo
                                      .saveOwner(selectedOwner!);
                                });
                                Navigator.pop(context);
                              } else {
                                const AlertDialog(
                                  content: SizedBox(
                                    width: 100,
                                    child: Text("Dados invalidos"),
                                  ),
                                );
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
                      ]),
                ));
          }
        }));
  }

  Widget selectResidences(List<Residence> residences) {
    return DropdownButton<Residence>(
      value: residenceValue,
      onChanged: (Residence? value) {
        setState(() {
          residenceValue = value!;
        });
      },
      items: residences.map<DropdownMenuItem<Residence>>((Residence value) {
        return DropdownMenuItem<Residence>(
          value: value,
          child: Text(value.number.toString()),
        );
      }).toList(),
    );
  }
}
