import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../data/hive_adapters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs

@HiveType(typeId: HiveAdapters.user)
@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
  }) = _User;

  factory User.initial() => const User(id: '', name: '', email: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String toString() => name;
}
