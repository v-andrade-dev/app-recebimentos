import 'package:app_flutter/backend/repositories/residences/residence.repo.dart';
import 'package:app_flutter/models/residence.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IResidenceRepo, env: [Environment.dev])
class ResidenceRepoTest implements IResidenceRepo {
  @override
  Future<List<Residence>> getResidences() {
    return Future(() => _residences);
  }

  final List<Residence> _residences = [
    Residence(
      id: 1,
      number: 20,
    ),
    Residence(
      id: 2,
      number: 30,
    ),
    Residence(
      id: 3,
      number: 30,
    )
  ];
}
