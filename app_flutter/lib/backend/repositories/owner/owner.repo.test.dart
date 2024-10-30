import 'package:app_flutter/backend/config/environment.settings.dart';
import 'package:app_flutter/backend/repositories/owner/owner.repo.dart';
import 'package:app_flutter/models/owner.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IOwnerRepo, env: [Environment.dev])
class OwnerRepoTest implements IOwnerRepo {
  @override
  Future<List<Owner>> getOwners() {
    debugPrint("REPO TESTE");
    return Future(() => List.empty());
  }
}
