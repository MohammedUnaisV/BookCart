import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Admin/Admin_LogIn.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkPackage();
  }

  Future<void> checkPackage() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String packageName = packageInfo.packageName;

      if (mounted) {
        Future.delayed(Duration(seconds: 3), () {
          if (packageName == "com.android.application") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LogPage()),
            );
          } else if (packageName == "com.example.admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminLogpage()),
            );
          }
          print("Package Name: $packageName");
        });
      }
    } catch (e) {
      print("Error getting package info: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200),
          Center(
            child: Image.asset(
              "assets/images/Frame 1.png",
              scale: 6,
            ),
          ),
          SizedBox(height: 200),
          Text(
            "BOOKCART, BOOK STORE",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
