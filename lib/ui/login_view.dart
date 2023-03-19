import 'package:flutter/material.dart';
import 'package:shared_preference/ui/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userEmail = '';

  void logIn(String email, String password) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', email);
    sp.setString('password', password);
    sp.setBool('isLogin', true);
    userEmail = sp.getString('email') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  focusColor: Colors.grey,
                  filled: true,
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  focusColor: Colors.grey,
                  filled: true,
                  prefixIcon: const Icon(Icons.password),
                  hintText: 'Password',
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  logIn(emailController.text, passwordController.text);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomeView())));
                });
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Center(
                    child: Text(
                  'LogIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                )),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
                userEmail,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              )),
            ),
          ],
        ),
      )),
    );
  }
}
