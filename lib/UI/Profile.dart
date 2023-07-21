import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(
                    //   "Profile",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 25,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: Color(0x408E97FD),
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff8E97FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        width: 130,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Location',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
