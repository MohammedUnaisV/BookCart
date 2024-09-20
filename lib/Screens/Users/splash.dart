import 'package:bookcartproject1/Constants/mycolors.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogPage(),));
      },);
    }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:200),
            Center(child:
            Image.asset("assets/images/Frame 1.png",scale: 6,)
            ),
            SizedBox(height: 200,),

            Text("BOOKCART, BOOK STROE",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,
                  color: Colors.white),)
          ]
      ),
    );
  }
}
