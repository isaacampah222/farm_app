import 'package:farm_app/core/error/exception.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/user.dart';

abstract class UserRemoteDatabase {
  Future<User> login({required String email, required String password});

  Future<User> register(
      {required String email, required String password, required String name});
}

class UserRemoteDatabaseImpl implements UserRemoteDatabase {
  @override
  Future<User> login({required String email, required String password}) async {
    try {
      List users = [];
      final snapshot =
          await FirebaseDatabase.instance.ref('users').once().then((value) {
        for (var val in value.snapshot.children) {
          users.add(val.value as Map<dynamic, dynamic>);
        }
      });
      users = users.map((e) => Map<String, dynamic>.from(e)).toList();
      var user = users.where((element) =>
          element['email'] == email && element['password'] == password);
      if (user.isEmpty) {
        throw DeviceException('Incorrect Credentials');
      } else {
        return User.fromJson(user.first);
      }
    } on FirebaseException {
      throw DeviceException('Invalid Error!');
    }
  }

  @override
  Future<User> register(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final id = Uuid().v1().toString().substring(0, 8);
      final userRef = FirebaseDatabase.instance.ref('users');
      final newPostRef = userRef.push();
      final user = {
        'id': id,
        'email': email,
        'name': name,
        'password': password
      };
      await newPostRef.set(user);
      return User.fromJson(user);
    } on FirebaseException {
      throw DeviceException('Error Creating User');
    }
  }
}
