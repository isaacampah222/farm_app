import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class CreateUser implements UseCase<User, CreateUserParams> {
  /// Constructor
  CreateUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(CreateUserParams params) =>
      repository.create(user: params.user, password: params.password);
}

class CreateUserParams extends Equatable {
  final User user;
  final String password;

  CreateUserParams({required this.user, required this.password});

  @override
  List<Object?> get props => [user, password];
}
