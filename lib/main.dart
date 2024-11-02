
import 'dart:async';

import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Provider/MaineProvider.dart';
import 'package:bookcartproject1/Screens/Admin/Add_Product.dart';
import 'package:bookcartproject1/Screens/Admin/Carousel_Add.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/My_order.dart';
import 'package:bookcartproject1/Screens/Users/OrderDetailes.dart';
import 'package:bookcartproject1/Screens/Users/registration.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:bookcartproject1/Screens/Users/orderSummery.dart';
import 'package:bookcartproject1/Screens/Users/splash.dart';
import 'package:bookcartproject1/example.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Admin_Provider.dart';
import 'Screens/Admin/Add_Pages.dart';
import 'Screens/Admin/Admin_LogIn.dart';
import 'Screens/Admin/Category_View_List.dart';
import 'Screens/Admin/Prodect_View_List.dart';
import 'Screens/Admin/addCategory.dart';



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
      ChangeNotifierProvider(create: (context) => LogProvider(),),
      ChangeNotifierProvider(create: (context) => AdminProvider(),),
      ChangeNotifierProvider(create: (context) => MainProvider(),),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // home: MyOrder(),
        home:Splash(),
        // home: AddPages(),
        // home: AdminLogpage(),
        // home: Homepage(),
        // home: AdminSplash(),
        // home: ordersummery(),
      )
    );
  }
}

