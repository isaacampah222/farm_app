import 'package:farm_app/core/usecases/usecase.dart';
import 'package:farm_app/core/user/domain/usecases/logout.dart';

class HomeBloc {
  final LogoutUser logoutUser;

  HomeBloc(this.logoutUser);

  Future<String?> logout() async {
    final result = await logoutUser(NoParams());
    return result.fold((l) => l.toString(), (r) => null);
  }
}
