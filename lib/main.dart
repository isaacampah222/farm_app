import 'package:farm_app/firebase_options.dart';
import 'package:farm_app/src/home/presentation/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: HomePage(),
    title: "Farm IOT",
    debugShowCheckedModeBanner: false,
  ));
}
