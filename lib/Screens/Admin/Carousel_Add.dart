// import 'package:bookcartproject1/Constants/mycolors.dart';
// import 'package:bookcartproject1/Screens/Admin/Add_Pages.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../Provider/Admin_Provider.dart';
//
// class carouselAdd extends StatefulWidget {
//   const carouselAdd({super.key});
//
//   @override
//   State<carouselAdd> createState() => _carouselAddState();
// }
//
// class _carouselAddState extends State<carouselAdd> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child:  Scaffold(backgroundColor: subcolor,
//       appBar: AppBar(
//         backgroundColor: maincolor,
//         title: Text("Carousel",style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             fontFamily: "aleo"
//         ),
//         ) ,
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(20),
//             bottomRight: Radius.circular(20),
//           ),
//         ),
//       ),
//
//       body: Column(
//         children: [
//
//
//           Padding(
//             padding: const EdgeInsets.only(left:20,top: 80),
//             child: InkWell(onTap: () {
//               showBottomSheet(context);
//
//             },
//               child: Container(
//                 height: 140,
//                 width:320,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.white,
//
//                 ),
//
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20,top: 40),
//             child: Container(
//               width: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: maincolor
//               ),
//               child: TextButton(onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => AddPages(),));
//               }, child:Text("OK",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                 ),
//               )
//               ),
//             ),
//           )
//         ],
//       ),
//
//
//
//     )
//     );
//
//
//   }
//
//
//   void showBottomSheet(BuildContext context) {
//     AdminProvider mainProvider = Provider.of<AdminProvider>(context, listen: false);
//     showModalBottomSheet(
//       elevation: 10,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10.0),
//           topRight: Radius.circular(10.0),
//         ),
//       ),
//       context: context,
//       builder: (BuildContext bc) {
//         return Wrap(
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(
//                 Icons.camera_enhance_sharp,
//                 color: Colors.blue,
//               ),
//               title: const Text('Camera'),
//               onTap: () {
//                 mainProvider.cagetImgcamera();
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo, color: Colors.blue),
//               title: const Text('Gallery'),
//               onTap: () {
//                 mainProvider.cagetImggallery();
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
