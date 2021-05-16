import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ! here I am going to make drawer widget

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://i.scdn.co/image/c0a738960bec5bde7462601abaaf37a0d238dcf3";

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Rafeh Qazi"),
                accountEmail: Text("clever_programmer@gmail.com"),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
              )),
          ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text("Home",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white))),
          ListTile(
              leading: Icon(CupertinoIcons.phone, color: Colors.white),
              title: Text("Contact",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white))),
          ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)))
        ],
      ),
    ));
  }
}
