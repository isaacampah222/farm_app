import 'package:farm_app/src/register/presentation/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

void initRegister() {
  final sl = GetIt.instance;

  sl.registerFactory(() => RegisterBloc(sl()));
}
