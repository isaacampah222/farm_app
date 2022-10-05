import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

/// Blue print for usecase
abstract class UseCase<Type, Params> {
  /// Forward usecase classes to repositories
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when usecase doesn't take any parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// Used for token/single value required usecase
class TokenParams extends Equatable {
  /// Constructor
  const TokenParams(
    this.token,
  );

  /// Authorization token
  /// OR
  /// A single value parameter
  final String token;

  @override
  List<Object> get props => [token];
}

/// Used for token/string value required usecase
class StringParams extends Equatable {
  /// Constructor
  const StringParams(this.value);

  /// Authorization token
  /// OR
  /// A single value parameter
  final String value;

  @override
  List<Object> get props => [value];
}
