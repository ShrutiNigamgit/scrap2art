import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'BuyPage.dart';
import 'Music.dart';
import 'Profile.dart';
import 'SellPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.shopping_cart,
    Icons.music_note_outlined,
    Icons.person_4_outlined,
  ];

  List<Widget> pagesList = <Widget>[
    HomePageContent(),
    BuyPage(
      raw: false,
    ),
    MusicPage(),
    ProfilePage(),
    SellPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(eccentricity: 0.0),
          backgroundColor: Color(0xff8E97FD),
          onPressed: () {
            setState(() {
              _bottomNavIndex = 4;
              // print("Index is tapped $_bottomNavIndex");
            });
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          height: 70,
          notchMargin: 10,
          splashColor: Color(0xff8E97FD),
          activeColor: Color(0xff8E97FD),
          icons: iconList,
          iconSize: 30,
          elevation: 50,
          blurEffect: true,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.sharpEdge,
          onTap: (index) => setState(() {
            _bottomNavIndex = index;
            // print("Index is tapped $_bottomNavIndex");
          }),
        ),
        body: pagesList[_bottomNavIndex]);
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50, 10, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "What brings you to Scrap2Art?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Features",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SellPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff8E97FD),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/WelcomeImage11.png"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Sell Scrap",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        // but this needs to go with raw buy page.
                        MaterialPageRoute(
                            builder: (context) => BuyPage(
                                  raw: true,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFA6E5A),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/WelcomeImage12.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Buy Scrap",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SellPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFEB18F),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/WelcomeImage21.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Sell your creativity",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuyPage(
                                  raw: false,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFFCF86),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/WelcomeImage22.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Find something UNIQUE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
