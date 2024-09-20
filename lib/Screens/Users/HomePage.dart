
import 'package:bookcartproject1/Constants/images.dart';
import 'package:bookcartproject1/Screens/Users/+1%20guide.dart';
import 'package:bookcartproject1/Screens/Users/+1%20text.dart';
import 'package:bookcartproject1/Screens/Users/+2%20Text.dart';
import 'package:bookcartproject1/Screens/Users/+2%20guide.dart';
import 'package:bookcartproject1/Screens/Users/Account.dart';
import 'package:bookcartproject1/Screens/Users/English%20Novels.dart';
import 'package:bookcartproject1/Screens/Users/Malayalam%20Novel.dart';
import 'package:bookcartproject1/Screens/Users/PSC.dart';
import 'package:bookcartproject1/Screens/Users/cart.dart';
import 'package:bookcartproject1/Screens/Users/orderSummery.dart';
import 'package:bookcartproject1/Screens/Users/ref%20page.dart';
import 'package:bookcartproject1/Screens/Users/story%20books.dart';
import 'package:bookcartproject1/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../Constants/mycolors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> books = [
      "assets/images/img_3.png",
      "assets/images/img_4.png",
      "assets/images/img_5.png",
      "assets/images/img_6.png",
      "assets/images/img_7.png",
      "assets/images/image 11.png",
      "assets/images/img_9.png",
      "assets/images/img_10.png",
    ];

    List<String> bookst = [
      "   +1 Text",
      "   +1 Guide",
      "   +2 Text",
      "   +2 Guide",
      "       PSC",
      "Story Books",
      "Malayalam \n   Novels",
      "    English \n    Novels",
    ];

    List<Widget> booksname = [
      InkWell(onTap: () {

      },
          child: pluonetext()),
      plusoneguid(),
      plustwotext(),
      plustwoguide(),
      psc(),
      storybooks(),
      malayalamnovels(),
      englishnovels(),
    ];

    List<String> Carouselimg = [
      "assets/images/image 3.png",
      "assets/images/ad img.webp",
      "assets/images/add.png"
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: subcolor,
        appBar: AppBar(
          backgroundColor: Color(0xff2C5F2D),
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontFamily: "allerta",
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Image.asset(
                  logo,
                  scale: 2.5,
                ),
              ),
              Container(
                height: 40,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black, // Black border color
                    width: 1, // Border width
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    hintText: "search.....",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),







              SizedBox(height: 30),
              // CarouselSlider widget
              Container(
                height: height / 4,
                width: width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height / 3,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                  ),
                  items: Carouselimg.map((item) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item,),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item, fit: BoxFit.cover),
                    ),
                  )
                  ).toList(),
                ),
              ),








              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height / 3,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: maincolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, left: 10),
                    child: GridView.builder(
                      itemCount: books.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 110,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => booksname[index],
                                ));
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(books[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Text(
                                bookst[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "allerta",
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 65,
          width: 350,
          color: maincolor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70, top: 10),
                child: Column(
                  children: [
                    Icon(Icons.home, color: Colors.blue),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "allerta",
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => cart(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 80, top: 10),
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      Text(
                        "Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "allerta",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => account(),));
                  },
                  child: Column(
                    children: [
                      Icon(Icons.supervisor_account_rounded, color: Colors.white),
                      Text(
                        "Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "allerta",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
