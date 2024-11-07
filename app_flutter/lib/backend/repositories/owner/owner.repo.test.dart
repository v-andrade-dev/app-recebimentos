import 'dart:math';

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
        id: 1,
        name: "Fulano",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 20)),
    Owner(
        id: 2,
        name: "Fulano 2",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 30)),
    Owner(
        id: 3,
        name: "Fulano 3",
        document: "111111",
        email: "mail.com",
        residence: Residence(number: 50)),
  ];

  @override
  Future<bool> saveOwner(Owner owner) {
    if (owner.id != null && ownerExist(owner.id!)) {
      var o = _owners.firstWhere((o) => o.id == owner.id!);
      o.document = owner.document;
      o.email = owner.email;
      o.name = owner.name;
    } else {
      owner.id = Random().nextInt(9999);
      _owners.add(owner);
    }
    return Future(() => _owners.contains(owner));
  }

  bool ownerExist(int id) {
    if (_owners.any((owner) => owner.id == id)) {
      return true;
    }
    return false;
  }
}
