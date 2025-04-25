import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noteappflutteronline73/presentation/screens/home_screen.dart';
import 'package:noteappflutteronline73/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(

      EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: "assets/translation",
    fallbackLocale: Locale('en'),
    child: MyApp(),


  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future <bool>  getLoginValue ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final logged = await prefs.getBool("logged");
    return logged!;

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: getLoginValue == true? HomeScreen() : LoginScreen(),
    );
  }
}
