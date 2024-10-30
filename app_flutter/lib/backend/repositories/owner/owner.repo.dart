import 'dart:convert';

import 'package:app_flutter/backend/config/environment.settings.dart';
import 'package:app_flutter/backend/data/http_client.dart';
import 'package:app_flutter/models/owner.dart';
import 'package:injectable/injectable.dart';

abstract class IOwnerRepo {
  Future<List<Owner>> getOwners();
}

@Singleton(as: IOwnerRepo, env: [Environment.test])
class OwnerRepo implements IOwnerRepo {
  final IHttpClient client;

  OwnerRepo({required this.client});

  @override
  Future<List<Owner>> getOwners() async {
    final response =
        await client.get(url: "https://192.168.0.16:7215/api/owner");

    if (response.statusCode == 200) {
      List<Owner> owners = [];

      final body = jsonDecode(response.body);
      body.map((item) {
        final Owner owner = Owner.fromMap(item);
        owners.add(owner);
      }).toList();

      return owners;
    }

    throw Exception("Não foi possivel recuperar os dados");
  }
}
