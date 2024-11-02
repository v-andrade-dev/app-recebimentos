// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_flutter/backend/data/http_client.dart' as _i995;
import 'package:app_flutter/backend/repositories/owner/owner.repo.dart' as _i52;
import 'package:app_flutter/backend/repositories/owner/owner.repo.test.dart'
    as _i295;
import 'package:app_flutter/backend/repositories/residences/residence.repo.dart'
    as _i591;
import 'package:app_flutter/backend/repositories/residences/residence.repo.test.dart'
    as _i107;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _test = 'test';
const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i995.HttpClient>(() => _i995.HttpClient());
    gh.singleton<_i591.IResidenceRepo>(
      () => _i591.ResidenceRepo(client: gh<_i995.IHttpClient>()),
      registerFor: {_test},
    );
    gh.singleton<_i52.IOwnerRepo>(
      () => _i52.OwnerRepo(client: gh<_i995.IHttpClient>()),
      registerFor: {_test},
    );
    gh.singleton<_i591.IResidenceRepo>(
      () => _i107.ResidenceRepoTest(),
      registerFor: {_dev},
    );
    gh.singleton<_i52.IOwnerRepo>(
      () => _i295.OwnerRepoTest(),
      registerFor: {_dev},
    );
    return this;
  }
}
