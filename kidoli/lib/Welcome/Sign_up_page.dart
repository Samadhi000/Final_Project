// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kidoli/Welcome/Login_page.dart';

import '../Constant/Constant_var.dart';
import '../models/user_model.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passworController = TextEditingController();
  final cpassworController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Welcome to KIDOLI ",
                          style: TextStyle(
                            fontSize: 25,
                            color: PrimaryColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Text(
                        'Get Start from here',
                        style: TextStyle(fontSize: 20),
                      ),

                      /*Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SignInButton(
                          Buttons.Google,
                          text: "Sign Up with Google",
                          onPressed: () {},
                        ),
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        text: "Sign Up with Facebook",
                        onPressed: () {},
                      ),

                       */
                      Container(
                        height: 20.0,
                      ),
                      Text(
                        'Signup with your E-mail',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.60,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, bottom: 4),
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("enter valid email address");
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Colors.grey,
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
                                    hintText: "E-mail Address"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10, bottom: 4),
                              child: TextFormField(
                                controller: passworController,
                                validator: (value) {
                                  RegExp regex = new RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return ("you need to provide valid password");
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("Password should be include at least 6 characters");
                                  }
                                },
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
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
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: TextFormField(
                                controller: cpassworController,
                                validator: (value) {
                                  if (cpassworController.text.length > 6 &&
                                      passworController.text != value) {
                                    return ("Password dont match");
                                  }
                                },
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.grey,
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
                                    hintText: "Re-enter Password"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SignInButton(
                                Buttons.Google,
                                text: "Sign Up with Google",
                                onPressed: () {},
                              ),
                            ),
                            SignInButton(
                              Buttons.Facebook,
                              text: "Sign Up with Facebook",
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.09,
                        ),
                        Container(
                          height: 140,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: 250,
                                  height: 50,
                                  child: TextButton(
                                      child: Text("Register".toUpperCase(),
                                          style: TextStyle(fontSize: 14)),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(EdgeInsets.all(15)),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  PrimaryColor),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50.0),
                                                  side: BorderSide(color: PrimaryColor)))),
                                      onPressed: () {
                                        Signup(emailController.text,
                                            passworController.text);
                                      }),
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 50,
                                child: TextButton(
                                    child: Text("Cancel".toUpperCase(),
                                        style: TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(EdgeInsets.all(15)),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                PrimaryColor),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                side: BorderSide(color: PrimaryColor)))),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const login_page()),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Allready have an account?",
                                  style: TextStyle(
                                    color: PrimaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Signup(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {})
          .catchError((e) {
        print("catch");
        Fluttertoast.showToast(msg: e!.message);
      });
      Fluttertoast.showToast(msg: "Account Created");
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    userModel usermodel = userModel();

    usermodel.email = user!.email;

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Account Created");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => login_page()),
        (route) => false);
  }
}
