import 'package:app_flutter/models/base_model.dart';

class Residence extends BaseModel {
  int? number;
  String? complement;

  //Residence.newResidence({required this.number, this.complement});
  Residence({int? id, required this.number, this.complement}) : super(id);

  factory Residence.fromMap(Map<String, dynamic> map) {
    return Residence(
        id: map["id"], number: map["number"], complement: map["complement"]);
  }

  Residence.fromJson(Map<String, dynamic> json) : super(json['id']) {
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
