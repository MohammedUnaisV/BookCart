import 'package:bookcartproject1/Provider/Admin_Provider.dart';
import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Screens/Users/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Admin Register.dart';


class AdminLogpage extends StatefulWidget {
  AdminLogpage({super.key});

  @override
  State<AdminLogpage> createState() => _AdminLogpageState();
}

class _AdminLogpageState extends State<AdminLogpage> {
  final TextEditingController AdminphoneController = TextEditingController();
  final TextEditingController AdminpasswordController = TextEditingController();

  @override
  void dispose() {
    AdminphoneController.dispose();
    AdminpasswordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff2C5F2D),
      body: Consumer<AdminProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/Vector 1.png"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(105, 60, 10, 10),
                      child: Text(
                        "Admi Log In",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          fontFamily: "loging",
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/img.png",
                  scale: 2.5,
                ),
                SizedBox(height:height/15),
                Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      Container(
                        height:height/13,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: AdminphoneController,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            hintText: "Enter Mobile number",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "abeze",
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Mobile number';
                            } else if (value.length < 10) {
                              return "Enter a valid 10-digit number";
                            }
                            return null;
                          },
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(height:height/50),
                      Container(
                        height:height/ 13,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: AdminpasswordController,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "abeze",
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          maxLength: 10,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width:width/3),
                          Text(
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Admin_SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:height/ 50),
                      TextButton(
                        onPressed: () async {
                          if (value.formKey.currentState!.validate()) {
                            // Call usersAuthorized and handle its boolean return value
                            await value.usersAuthorized(AdminphoneController.text, AdminpasswordController.text, context);

                            // Only navigate if the authorization is successful
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "abeze",
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
