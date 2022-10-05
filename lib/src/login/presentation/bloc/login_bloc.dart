import 'package:farm_app/core/user/domain/usecases/login.dart';

class LoginBloc {
  final RetrieveUser retrieveUser;

  LoginBloc(this.retrieveUser);

  Future<String?> signIn(
      {required String email, required String password}) async {
    final result = await retrieveUser(
        RetrieveUserParams(email: email, password: password));
    return result.fold((l) => l.toString(), (r) => null);
  }
}
