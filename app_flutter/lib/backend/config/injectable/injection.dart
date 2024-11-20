import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String environment) =>
    getIt.init(environment: environment);

//dart run build_runner build
//dart run build_runner build --delete-conflicting-outputs