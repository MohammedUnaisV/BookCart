import 'package:bookcartproject1/Provider/Log_Provider.dart';
import 'package:bookcartproject1/Screens/Users/HomePage.dart';
import 'package:bookcartproject1/Screens/Users/logPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff2C5F2D),
      body: Consumer<LogProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/Vector 1.png"),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(135, 60, 10, 10),
                      child: Text(
                        "SIGN UP",
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
                 SizedBox(height:height/50),
                Form(
                  key: formKey, // Use the local form key here
                  child: Column(
                    children: [
                      Container(
                        height:height/14,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: value.regphoneController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
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
                              return 'Please enter your mobile number';
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
                        height:height/14,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: value.regpasswordController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
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
                        ),
                      ),
                       SizedBox(height:height/50),
                      Container(
                        height:height/14,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: value.nameController,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            hintText: "Enter Name",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "abeze",
                            ),
                          ),
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Please enter your Name';
                               }
                               return null;
                             }

                        ),
                      ),
                      SizedBox(height:height/50,),
                      Container(
                        height:height/14,
                        width:width/1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                            controller: value.AddressController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              hintText: "Enter Address",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "abeze",
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Address';
                              }
                              return null;
                            }

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "SIGN IN",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:height/50),
                      Container(
                        height:height/16,
                        width:width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              value.addDetails(context,"NEW","").
                              then((_) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Homepage(userid: '',)),
                                );
                              }
                              );
                            }
                          },
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
