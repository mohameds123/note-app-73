import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteappflutteronline73/presentation/screens/login_screen.dart';
import 'package:noteappflutteronline73/presentation/screens/sign_up_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: LoginScreen(),
    );
  }
}

