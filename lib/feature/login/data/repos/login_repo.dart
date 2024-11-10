import 'package:dartz/dartz.dart';
import 'package:shopy_app/feature/login/data/model/login_model.dart';

import '../../../../core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> loginUser(
      {required String email, required String password});
}
