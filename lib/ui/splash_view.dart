import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/ui/admin_view.dart';
import 'package:shared_preference/ui/home_view.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preference/ui/signup_view.dart';
import 'package:shared_preference/ui/student_view.dart';
import 'package:shared_preference/ui/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    isLogedIn();
  }

  Future isLogedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isUserSignIn = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('type') ?? '';

    if (isUserSignIn) {
      if (userType == 'Teacher') {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const TeacherView())));
        });
      } else if (userType == 'Admin') {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const AdminView())));
        });
      } else {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const StudentView())));
        });
      }
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const LoginView())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
