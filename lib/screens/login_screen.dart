import "package:flutter/material.dart";
import 'package:flutter_mini_project_1/screens/list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인")),
      body: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: MediaQuery.of(context).size.width * 0.85,
              child: ElevatedButton(
                onPressed: (() {
                  setLogin().then((value) => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ListScreen()))
                      });
                }),
                child: const Text("로그인"),
              ))),
    );
  }

  Future setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", true);
  }
}
