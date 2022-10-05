import 'package:farm_app/core/user/domain/usecases/create.dart';

import '../../../../core/user/domain/entities/user.dart';

class RegisterBloc {
  final CreateUser createUser;

  RegisterBloc(this.createUser);

  Future<String?> signUp({required User user, required String password}) async {
    final result =
        await createUser(CreateUserParams(user: user, password: password));
    return result.fold((l) => l.toString(), (r) => null);
  }
}
