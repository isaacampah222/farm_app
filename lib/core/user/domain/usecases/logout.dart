import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Logs a user out of an account
class LogoutUser implements UseCase<User, NoParams> {
  /// Constructor
  LogoutUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) => repository.logout();
}
