import 'package:app_flutter/backend/data/http_client.dart';
import 'package:app_flutter/models/residence.dart';
import 'dart:convert';

abstract class IResidenceRepo {
  Future<List<Residence>> getResidences();
}

class ResidenceRepo implements IResidenceRepo {
  final IHttpClient client;

  ResidenceRepo({required this.client});

  @override
  Future<List<Residence>> getResidences() async {
    final response =
        await client.get(url: 'https://192.168.0.16:7215/api/residences');

    if (response.statusCode == 200) {
      List<Residence> residences = [];

      final body = jsonDecode(response.body);
      body.map((item) {
        final Residence residence = Residence.fromMap(item);
        residences.add(residence);
      }).toList();

      return residences;
    }

    throw Exception("Não foi possivel recuperar os dados");
  }
}
