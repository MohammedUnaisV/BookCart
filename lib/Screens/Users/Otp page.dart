// import 'package:bookcartproject1/Provider/Log_Provider.dart';
// import 'package:bookcartproject1/Screens/Users/HomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';
//
// class Otppage extends StatefulWidget {
//   final String verificationid;
//
//   Otppage({super.key, required this.verificationid});
//
//   @override
//   State<Otppage> createState() => _OtppageState();
// }
//
// class _OtppageState extends State<Otppage> {
//   TextEditingController otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final otpProvider = Provider.of<MaineProvider>(context, listen: false);
//
//     return Scaffold(
//       backgroundColor: Color(0xff2C5F2D),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Image.asset("assets/images/Vector 1.png"),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(135, 60, 10, 10),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Enter OTP",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                           fontFamily: "akaya",
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Image.asset(
//                         "assets/images/img_1.png",
//                         scale: 3.5,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Please Enter The Verification Code Sent to \n             your Mobile number.",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: "abyssiSIL",
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(30),
//               child: Pinput(
//                 length: 6,
//                 controller: otpController,
//                 defaultPinTheme: PinTheme(
//                   textStyle: TextStyle(
//                     fontFamily: "jeju2",
//                     fontSize: 23,
//                   ),
//                   width: 70,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Container(
//                 height: 40,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: TextButton(
//                     onPressed: () {
//                       // Use the provider to verify the OTP
//                       otpProvider.verifyOtp(context, otpController.text);
//                     },
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "abyssiSIL",
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
