import 'package:get_it/get_it.dart';

import 'presentation/bloc/login_bloc.dart';

void initLogin() {
  final sl = GetIt.instance;

  sl.registerFactory(() => LoginBloc(sl()));
}
