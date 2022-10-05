import 'package:farm_app/core/data/hive_adapters.dart';
import 'package:farm_app/core/user/data/databases/user_local_database.dart';
import 'package:farm_app/firebase_options.dart';
import 'package:farm_app/src/home/presentation/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'src/login/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await HiveAdapters.setUp();
  final authState = await di.sl<UserLocalDatabase>().authenticationStatus();
  print(authState);
  runApp(MaterialApp(
    home: authState ? HomePage() : LoginPage(),
    title: "Farm IOT",
    debugShowCheckedModeBanner: false,
  ));
}
