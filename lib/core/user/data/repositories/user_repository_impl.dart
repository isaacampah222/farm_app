import 'package:dartz/dartz.dart';
import 'package:farm_app/core/error/failures.dart';
import 'package:farm_app/core/user/data/databases/user_local_database.dart';
import 'package:farm_app/core/user/data/databases/user_remote_database.dart';
import 'package:farm_app/core/user/domain/entities/user.dart';
import 'package:farm_app/core/user/domain/repositories/user_repository.dart';

import '../../../error/exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDatabase localDatabase;

  final UserRemoteDatabase remoteDatabase;

  UserRepositoryImpl(this.localDatabase, this.remoteDatabase);

  @override
  Future<Either<Failure, User>> logout() async {
    try {
      final result = User.initial();
      await localDatabase.save(result);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> retrieve(
      {required String email, required String password}) async {
    try {
      final result =
          await remoteDatabase.login(email: email, password: password);
      print(result);
      await localDatabase.save(result);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, User>> create(
      {required User user, required String password}) async {
    try {
      final result = await remoteDatabase.register(
          email: user.email, password: password, name: user.name);
      print(result);
      await localDatabase.save(result);
      return Right(result);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }
}
