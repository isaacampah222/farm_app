import 'package:farm_app/src/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

void initHome() {
  final sl = GetIt.instance;

  sl.registerFactory(() => HomeBloc(sl()));
}
