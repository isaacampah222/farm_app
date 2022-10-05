import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> retrieve(
      {required String email, required String password});

  Future<Either<Failure, User>> create(
      {required User user, required String password});

  Future<Either<Failure, User>> logout();
}
