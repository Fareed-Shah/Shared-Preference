import 'package:flutter/material.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
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
        title: const Text('Admin View '),
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
        child: Text('Admin'),
      ),
    );
  }
}
