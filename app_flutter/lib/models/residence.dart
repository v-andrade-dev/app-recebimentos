import 'package:app_flutter/models/base_model.dart';

class Residence extends BaseModel {
  int? number;
  String? complement;

  Residence({this.number, this.complement});

  Residence.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    complement = json['complement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['complement'] = complement;
    return data;
  }
}
