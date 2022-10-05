import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RetrieveUser implements UseCase<User, RetrieveUserParams> {
  /// Constructor
  RetrieveUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(RetrieveUserParams params) =>
      repository.retrieve(password: params.password, email: params.email);
}

class RetrieveUserParams extends Equatable {
  final String email;
  final String password;

  RetrieveUserParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
