import 'package:bookcartproject1/Provider/Maine_Provider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C5F2D),
      body: Consumer<MaineProvider>(
        builder: (context, loging, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/Vector 1.png"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(135, 60, 10, 10),
                      child: Text(
                        "Sign In",
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
                SizedBox(height: 20),
                Form(
                  key: loging.formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: loging.phoneController,
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
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: loging.passwordController,
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
                            } else if (value.length < 10) {
                              return "Password must be at least 10 characters";
                            }
                            return null;
                          },
                          maxLength: 10,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 130),
                          Text(
                            "Don't have an Account?",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              loging.logDetails();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
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
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          if (loging.formKey.currentState!.validate()) {
                            // Get the saved phone number and password from SharedPreferences
                            String savedPhoneNumber = loging.regphoneController.text;
                            String savedPassword = loging.regpasswordController.text;

                            // Get the entered phone number and password
                            String enteredPhoneNumber = loging.phoneController.text;
                            String enteredPassword = loging.passwordController.text;


                            // Check if the entered details match the saved details
                            if (enteredPhoneNumber == savedPhoneNumber &&
                                enteredPassword == savedPassword) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homepage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Please enter a valid phone number or password."),
                                ),
                              );
                            }
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









