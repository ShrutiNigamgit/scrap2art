import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:scrap2art/UI/Chat/AllChats.dart';
import 'BuyPage.dart';
import 'Profile.dart';
import 'SellPage.dart';
import 'Tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.sell_outlined,
    Icons.lightbulb_outline,
    Icons.person_outline,
  ];

  List<Widget> pagesList = <Widget>[
    HomePageContent(),
    BuyPage(
      raw: false,
    ),
    TipsnTricks(),
    ProfilePage(),
    SellPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Color(0xff8E97FD),
        onPressed: () {
          setState(() {
            _bottomNavIndex = 4;
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
        }),
      ),
      body: pagesList[_bottomNavIndex],
    );
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome to Scrap2Art!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color:Colors.black,),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllChats()),
                        );
                      },
                      child: Image.asset('assets/Whitelogo.jpeg', width:150, height: 100)),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    _featureButton("Sell Scrap", "assets/WelcomeImage11.png", Color(0xff8E97FD), false),
                    _featureButton("Buy Scrap", "assets/WelcomeImage12.png", Color(0xffFA6E5A), true),
                    _featureButton("Sell your creativity", "assets/WelcomeImage21.png", Color(0xffFEB18F), false),
                    _featureButton("Find something UNIQUE", "assets/WelcomeImage22.png", Color(0xffFFCF86), true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureButton(String title, String imageAsset, Color color, bool isBuyPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => isBuyPage ? BuyPage(raw: isBuyPage) : SellPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageAsset),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
