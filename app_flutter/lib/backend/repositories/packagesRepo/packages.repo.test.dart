import 'dart:math';

import 'package:app_flutter/backend/repositories/packagesRepo/packages.repo.dart';
import 'package:app_flutter/models/package.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IPackagesRepo, env: [Environment.dev])
class PackagesRepoTest implements IPackagesRepo {
  @override
  Future<List<Package>> getPackages() {
    return Future(() => _packages.where((e) => e.entryDate != null).toList());
  }

  @override
  Future<List<Package>> getPackageByResidenceID(int residenceID) {
    return Future(() => _packages
        .where((e) => e.residence!.id == residenceID && e.entryDate != null)
        .toList());
  }

  @override
  Future<List<Package>> getPredictedPackages() {
    return Future(() => _packages
        .where((e) => e.predictedDate != null && e.arrived != true)
        .toList());
  }

  @override
  Future<bool> savePackages(Package package) {
    package.id = Random().nextInt(9999);
    _packages.add(package);
    return Future(() => _packages.any((e) => e.id == package.id));
  }

  final List<Package> _packages = [
    Package(
      id: 0,
      ownerName: 'Fulano',
      shipper: "Amazon",
      entryDate: DateTime(2024, 11, 09),
      residence: Residence(id: 1, number: 20),
    ),
    Package(
      id: 1,
      ownerName: 'Ciclano',
      shipper: "Mercado Livre",
      entryDate: DateTime(2024, 11, 09),
      residence: Residence(id: 1, number: 20),
    ),
    Package(
      id: 2,
      ownerName: 'Beltrano',
      shipper: "Amazon",
      entryDate: DateTime(2024, 11, 09),
      residence: Residence(id: 3, number: 50),
    ),
    Package(
      id: 3,
      ownerName: 'Ciclano ',
      shipper: "Mercado Livre",
      predictedDate: DateTime(2024, 12, 20),
      residence: Residence(id: 2, number: 30),
    ),
    Package(
      id: 1,
      ownerName: 'Beltrano',
      shipper: "Mercado Livre",
      predictedDate: DateTime(2025, 01, 05),
      residence: Residence(id: 2, number: 30),
    ),
  ];
}
