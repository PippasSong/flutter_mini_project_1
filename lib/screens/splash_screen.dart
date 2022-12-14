import "package:flutter/material.dart";
import 'package:flutter_mini_project_1/screens/list_screen.dart';
import 'package:flutter_mini_project_1/screens/login_screen.dart';
import "dart:async";
import "package:shared_preferences/shared_preferences.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("SplashScreen", style: TextStyle(fontSize: 20)),
          Text("나만의 일정 관리 : TODO 리스트 앱", style: TextStyle(fontSize: 20))
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      moveScreen();
    });
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

//비동기 처리의 결과
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool("isLogin") ?? false; //처음에는 null
    print("[*] isLogin : " + isLogin.toString());
    return isLogin;
  }
}
