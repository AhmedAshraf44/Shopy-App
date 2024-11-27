import 'package:dartz/dartz.dart';
import 'package:shopy_app/core/errors/failure.dart';

import '../../../login/data/model/login_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, LoginModel>> getSettings();
}
