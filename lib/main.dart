
import 'dart:async';

import 'package:bookcartproject1/Provider/Maine_Provider.dart';
import 'package:bookcartproject1/Screens/Admin/All_Add_Page.dart';
import 'package:bookcartproject1/Screens/Admin/Show_Page.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/OrderDetailes.dart';
import 'package:bookcartproject1/Screens/Users/registration.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:bookcartproject1/Screens/Users/orderSummery.dart';
import 'package:bookcartproject1/Screens/Users/splash.dart';
import 'package:bookcartproject1/example.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAe-nXRoxB7dZPp6lcvdA0GsMfX2awxX3k",
        appId: "1:289116253181:android:743f056a5be36787234794",
        messagingSenderId:"289116253181",
        projectId: "bookcart-d7921",
      storageBucket:"bookcart-d7921.appspot.com",
    )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MaineProvider(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      
        home: AllAddPage(),
        // home: Example(),
        // home: Homepage(),
        // home: ShowPage(),
      )
    );
  }
}

