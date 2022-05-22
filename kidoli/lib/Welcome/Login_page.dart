// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidoli/Main_packages/Home.dart';

import '../Components/Botttom_nav_bar.dart';
import '../Constant/Constant_var.dart';
import 'Sign_up_page.dart';
var scaffoldkey = GlobalKey<ScaffoldState>();
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {


  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                      child: Text(
                    "Welcome back to Kidoli",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                  )),

                ),
                Container(
                  height: size.height * 0.38,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/reading.png',

                      ),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                  child: TextFormField(
                    controller: myController,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your E-mail");
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Kgrey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: PrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: PrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Username"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                  child: TextFormField(
                    controller: myController2,

                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required to login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Password must be longer than 6 characters");
                      }
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Kgrey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: PrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: PrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Password"),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                  child: Container(
                    width: 250,
                    height: 50,
                    child: TextButton(
                        child: Text("login".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Kwhite),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                PrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: PrimaryColor)))),
                        onPressed: () {
                          // Signin(myController.text, myController2.text);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => bottom_nav_bar()));
                        }),
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                    child: TextButton(
                        child: Text("Signup".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15)),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(PrimaryColor),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Kwhite),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: PrimaryColor)))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup()),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SignInButton(
                    Buttons.Facebook,
                    text: "Sign up with Facebook",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void Signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => bottom_nav_bar()))
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
