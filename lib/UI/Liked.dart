import 'package:flutter/material.dart';
import 'Tips.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedTips extends StatefulWidget {
  final List<String> likedAdvices;

  const LikedTips({required this.likedAdvices});

  @override
  State<LikedTips> createState() => _LikedTipsState();
}
class _LikedTipsState extends State<LikedTips> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveLikedTips() {
    if (prefs != null) {
      prefs!.setStringList('likedAdvices', widget.likedAdvices);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: widget.likedAdvices.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFF292929),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Text(
              widget.likedAdvices[index],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    saveLikedTips();
    super.dispose();
  }
}
