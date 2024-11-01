import 'package:app_flutter/models/base_model.dart';
import 'package:app_flutter/models/residence.dart';

class Owner extends BaseModel {
  String? name;
  String? document;
  String? email;
  Residence? residence;

  Owner.empty() : super.empty();
  Owner(
      {int? id,
      required this.name,
      required this.document,
      required this.email,
      required this.residence})
      : super(id);

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
        id: map["id"],
        name: map["name"],
        document: map["document"],
        email: map["email"],
        residence: Residence.fromMap(map["residence"]));
  }

  Owner.fromJson(Map<String, dynamic> json) : super(json['id']) {
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
