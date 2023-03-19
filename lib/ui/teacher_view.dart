import 'package:flutter/material.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const LoginView())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Techer View '),
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
        child: Text('Teacher'),
      ),
    );
  }
}
