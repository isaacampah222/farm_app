import 'package:farm_app/core/user/user_injection.dart';
import 'package:farm_app/src/login/login_injection.dart';
import 'package:farm_app/src/register/register_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'src/home/home_injection.dart';

final sl = GetIt.instance;

void init() {
  initUser();

  initLogin();

  initHome();

  initRegister();

  sl.registerLazySingleton<HiveInterface>(() => Hive);
}
