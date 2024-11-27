import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../login/data/model/login_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, LoginModel>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  });
}
