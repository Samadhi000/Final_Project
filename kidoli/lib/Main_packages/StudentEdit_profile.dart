import 'package:flutter/material.dart';

import '../Components/Botttom_nav_bar.dart';
import '../Constant/Constant_var.dart';

class StudentEditProfile extends StatefulWidget {
  const StudentEditProfile({Key? key}) : super(key: key);

  @override
  State<StudentEditProfile> createState() => _StudentEditProfileState();
}

class _StudentEditProfileState extends State<StudentEditProfile> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      'assets/sbg.jpg',
                    ),
                    fit: BoxFit.fill,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Center(
                      child: Text(
                    "Edit your Profile Details",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: PrimaryColor),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 10, bottom: 10),
                  child: TextFormField(
                    controller: myController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your Name");
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: fields,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
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
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 10, bottom: 10),
                  child: TextFormField(
                    controller: myController2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your Age");
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: fields,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.cake_outlined,
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
                        hintText: "Age"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 10, bottom: 10),
                  child: TextFormField(
                    controller: myController3,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your School");
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: fields,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.school_outlined,
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
                        hintText: "School"),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 10, top: 10),
                      child: Container(
                        width: 150,
                        height: 50,
                        child: TextButton(
                            child: Text("Submit".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(Kwhite),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        PrimaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side:
                                            BorderSide(color: PrimaryColor)))),
                            onPressed: () {
                              // Signin(myController.text, myController2.text);
                            }),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 10),
                        child: TextButton(
                            child: Text("Cancel".toUpperCase(),
                                style: TextStyle(fontSize: 14)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        PrimaryColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Kwhite),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side:
                                            BorderSide(color: PrimaryColor)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const bottom_nav_bar()),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
