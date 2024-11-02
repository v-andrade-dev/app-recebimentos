import 'package:app_flutter/backend/config/environment.settings.dart';
import 'package:app_flutter/backend/repositories/owner/owner.repo.dart';
import 'package:app_flutter/models/owner.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IOwnerRepo, env: [Environment.dev])
class OwnerRepoTest implements IOwnerRepo {
  @override
  Future<List<Owner>> getOwners() {
    debugPrint("REPO TESTE");
    return Future(() => _owners);
  }

  final List<Owner> _owners = [
    Owner(
        name: "Fulano",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 20)),
    Owner(
        name: "Fulano 2",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 30)),
    Owner(
        name: "Fulano 3",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 40)),
  ];
}
