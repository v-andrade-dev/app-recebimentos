import 'package:app_flutter/models/package.dart';
import 'package:injectable/injectable.dart';

abstract class IPackagesRepo {
  Future<List<Package>> getPackages();
  Future<List<Package>> getPackageByResidenceID(int residenceID);
  Future<List<Package>> getPredictedPackages();
  Future<bool> savePackages(Package package);
}

@Singleton(as: IPackagesRepo, env: [Environment.test])
class PackagesRepo implements IPackagesRepo {
  @override
  Future<List<Package>> getPackages() {
    // TODO: implement getPackages
    throw UnimplementedError();
  }

  @override
  Future<bool> savePackages(Package package) {
    // TODO: implement savePackages
    throw UnimplementedError();
  }

  @override
  Future<List<Package>> getPackageByResidenceID(int residenceID) {
    // TODO: implement getPackageByResidenceID
    throw UnimplementedError();
  }

  @override
  Future<List<Package>> getPredictedPackages() {
    // TODO: implement getPredictedPackages
    throw UnimplementedError();
  }
}
