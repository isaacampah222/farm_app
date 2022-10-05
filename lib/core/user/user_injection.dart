import 'package:farm_app/core/user/data/databases/user_local_database.dart';
import 'package:farm_app/core/user/data/databases/user_remote_database.dart';
import 'package:farm_app/core/user/data/repositories/user_repository_impl.dart';
import 'package:farm_app/core/user/domain/usecases/create.dart';
import 'package:farm_app/core/user/domain/usecases/login.dart';
import 'package:farm_app/core/user/domain/usecases/logout.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/user_repository.dart';

void initUser() {
  final sl = GetIt.instance;

  sl
    ..registerLazySingleton(() => RetrieveUser(sl()))
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => LogoutUser(sl()))
    ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<UserLocalDatabase>(
        () => UserLocalDatabaseImpl(sl()))
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new);
}
