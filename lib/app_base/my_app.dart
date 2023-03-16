import 'package:flutter/material.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preference/ui/signUp_view.dart';
import 'package:shared_preference/ui/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUpView(),
    );
  }
}
