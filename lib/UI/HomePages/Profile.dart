import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController =
      TextEditingController(text: "Name loading...");
  TextEditingController emailController =
      TextEditingController(text: "Email loading...");
  TextEditingController phoneController =
      TextEditingController(text: "Phone loading...");
  TextEditingController locationController =
      TextEditingController(text: "Location loading...");

  Future<bool> getDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    emailController.text = data["Email"];
    nameController.text = data["Name"];
    phoneController.text = "Phone";
    locationController.text = "Location";

    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getDetails();
      setState(() {});
    });
  }

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
                    GestureDetector(
                      onTap: () {
                        getDetails();
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0x408E97FD),
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 60,
                        ),
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
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Phone Number',
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                    TextField(
                      controller: locationController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Location',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: logout,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Color(0xFF7583CA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'LOG OUT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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

  void logout() async {
    try {
      // Sign the user out using FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Navigate to the login screen after successful logout
      Navigator.pushNamedAndRemoveUntil(
          context, 'initial_Welcome_Screen', (route) => false);
    } catch (e) {
      // Handle any potential errors during the logout process
      print('Error during logout: $e');
    }
  }
}