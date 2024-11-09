import 'package:app_flutter/models/base_model.dart';
import 'package:app_flutter/models/residence.dart';

class Package extends BaseModel {
  String? ownerName;
  String? shipper;
  DateTime? entryDate;
  DateTime? deliveryDate;
  String? receiver;
  bool? finish;
  Residence? residence;

  Package(
      {int? id,
      required this.ownerName,
      required this.shipper,
      required this.entryDate,
      this.deliveryDate,
      this.receiver,
      this.finish,
      required this.residence})
      : super(id);

  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
        id: map['id'],
        ownerName: map['ownerName'],
        shipper: map['shipper'],
        entryDate: map['entryDate'],
        deliveryDate: map['deliveryDate'] ?? '',
        receiver: map['receiver'] ?? '',
        finish: map['finish'] ?? false,
        residence: Residence.fromMap(map['residence']));
  }

  Package.fromJson(Map<String, dynamic> json) : super(json['id']) {
    id = json['id'];
    ownerName = json['ownerName'];
    shipper = json['shipper'];
    entryDate = json['entryDate'];
    deliveryDate = json['deliveryDate'];
    receiver = json['receiver'];
    finish = json['finish'];
    residence = Residence.fromJson(json['residence']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ownerName'] = ownerName;
    data['shipper'] = shipper;
    data['entryDate'] = entryDate;
    data['deliveryDate'] = deliveryDate;
    data['receiver'] = receiver;
    data['finish'] = finish;
    data['residence'] = residence;
    return data;
  }
}
