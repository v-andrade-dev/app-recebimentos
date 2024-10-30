import 'package:app_flutter/models/base_model.dart';
import 'package:app_flutter/models/residence.dart';

class Owner extends BaseModel {
  String? name;
  String? document;
  String? email;
  Residence? residence;

  Owner(
      {required this.name,
      required this.document,
      required this.email,
      required this.residence});

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
        name: map["name"],
        document: map["document"],
        email: map["email"],
        residence: Residence.fromMap(map["residence"]));
  }

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    document = json['document'];
    email = json['email'];
    residence = Residence.fromJson(json['residence']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['document'] = document;
    data['email'] = email;
    data['residence'] = residence;
    return data;
  }
}
