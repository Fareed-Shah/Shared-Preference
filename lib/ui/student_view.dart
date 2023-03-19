import 'package:flutter/material.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preference/ui/signup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const SignUpView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student View '),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          GestureDetector(onTap: logOut, child: const Icon(Icons.logout)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const Center(
        child: Text('Student'),
      ),
    );
  }
}
