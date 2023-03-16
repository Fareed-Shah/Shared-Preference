import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preference/ui/home_view.dart';
import 'package:shared_preference/ui/login_view.dart';
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

    if (isUserSignIn) {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const HomeView())));
      });
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
      ),
      body: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
