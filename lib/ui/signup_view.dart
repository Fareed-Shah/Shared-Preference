import 'package:flutter/material.dart';
import 'package:shared_preference/ui/admin_view.dart';
import 'package:shared_preference/ui/home_view.dart';
import 'package:shared_preference/ui/student_view.dart';
import 'package:shared_preference/ui/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userType = '';

  void onSignUp(String email, String password, String userType) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', email);
    sp.setString('password', password);
    sp.setString('type', userType);
    sp.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: Colors.green),
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
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    fillColor: Colors.green, filled: true),
                iconEnabledColor: Colors.green,
                dropdownColor: Colors.green,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    onTap: () {
                      userType = 'Admin';
                    },
                    child: const Text('Admin'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    onTap: () {
                      userType = 'Teacher';
                    },
                    child: const Text('Teacher'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    onTap: () {
                      userType = 'Student';
                    },
                    child: const Text('Student'),
                  )
                ],
                onChanged: (ValueKey) {}),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  onSignUp(
                      emailController.text, passwordController.text, userType);

                  if (userType == 'Teacher') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const TeacherView())));
                  } else if (userType == 'Admin') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const AdminView())));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const StudentView())));
                  }
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
          ],
        ),
      )),
    );
  }
}
