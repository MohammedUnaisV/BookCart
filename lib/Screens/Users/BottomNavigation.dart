import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants/mycolors.dart';
import 'HomePage.dart';
import 'cart.dart';
import 'Account.dart';

class BottomNavigation extends StatefulWidget {
  String userId;
  BottomNavigation({super.key,required this.userId});
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexNum = 0;

  // List of screens to switch between
   List<Widget> screens() {
     return [
       Homepage(userid: widget.userId), // Home page
       Cart(userId: widget.userId,),
       account(), // Account page
     ];
   }

  @override
  Widget build(BuildContext context) {
     var screen= screens();
    return Scaffold(
      body: screen[indexNum],  // Display the selected screen based on the index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: maincolor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
            fontFamily: "allerta", fontSize: 10, color: Colors.white),
        selectedLabelStyle: TextStyle(
            fontFamily: "allerta", fontSize: 15, color: Colors.blue),
        currentIndex: indexNum,  // Active screen index
        onTap: (int index) {
          setState(() {
            indexNum = index;  // Update index on tap
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_rounded),
            label: "Account",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
