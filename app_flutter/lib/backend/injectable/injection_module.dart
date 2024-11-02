// injection.dart
import 'package:app_flutter/backend/config/environment.settings.dart';
import 'package:app_flutter/backend/data/http_client.dart';
import 'package:app_flutter/backend/repositories/owner/owner.repo.dart';
import 'package:app_flutter/backend/repositories/owner/owner.repo.test.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {}
