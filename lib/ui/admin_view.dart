import 'package:flutter/material.dart';
import 'package:shared_preference/ui/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  String userType = '', userEmail = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const LoginView())));
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      userType = sp.getString('type') ?? '';
      userEmail = sp.getString('email') ?? '';
    });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              userType.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Text(
              userEmail.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
