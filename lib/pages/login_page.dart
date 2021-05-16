import 'package:catalog/utils/my_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool amime = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/Images/login.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            amime = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                          amime = false;
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: amime ? 40 : 140,
                          height: 40,
                          alignment: Alignment.center,
                          child: amime
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              //  ? shape: amime ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.circular(amime ? 50 : 10)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
