import 'package:flutter/material.dart';
import 'package:self_worker/components/constants.dart';
import 'package:self_worker/components/home_screen_components.dart';
import '';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0.0,
        backgroundColor: Colors.black12,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey,
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1666625628272-a1071f6f7173?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: animatedText("Rahul Dixit", 26),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text("Web Designer"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: Text(
                      "When the user gets a list of images from API and the user wants to display them in a Circular Avatar So in this article, we will be discussing How to Set Network Image In Circular Avatar In Flutter.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Divider(height: 36, color: Colors.white,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
