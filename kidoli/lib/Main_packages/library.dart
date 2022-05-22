// ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:snapshot/snapshot.dart';

import '../Components/side_menu_bar.dart';
import '../Constant/Constant_var.dart';
import '../models/user_model.dart';

import 'home.dart';


var scaffoldkey = GlobalKey<ScaffoldState>();

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final _auth = FirebaseAuth.instance;

  late final dref = FirebaseDatabase.instance.reference();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var collection = FirebaseFirestore.instance.collection('library');
  late DatabaseReference databaseReference;
  userModel usermodel = userModel();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var bill;

  // setData() {
  //   User? user = _auth.currentUser;
  //   usermodel.email = user!.email;
  //   dref
  //       .child(user.uid)
  //       .set({'id': "12", 'name': "sen", 'age': "23"}).asStream();
  // }

  // showData() {
  //   dref.once().then((DatabaseEvent results) {
  //     print(results.snapshot.value);
  //     return results.snapshot.value;
  //   });
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getfbdat().then((results) {
  //     setState(() {
  //       querySnapshot = results;
  //     });
  //   });
  // }

  // late QuerySnapshot querySnapshot;
  // static var gent;
  // static var size1;
  // static var cat;
  // @override
  // getfbdat() async {
  //   User? user = _auth.currentUser;
  //   usermodel.uid = user!.uid;
  //   var collection = FirebaseFirestore.instance
  //       .collection('Customer')
  //       .where('email', isEqualTo: user.email);
  //
  //   var querySnapshot = await collection.get();
  //   for (var queryDocumentSnapshot in querySnapshot.docs) {
  //     Map<String, dynamic> data = queryDocumentSnapshot.data();
  //     gent = data['gender'];
  //     size1 =  data['size'];
  //
  //
  //     print(gent);
  //     return gent;
  //   }
  // }
  // _signOut() async {
  //   await _firebaseAuth.signOut();
  // }
  // void handleClick(String value) {
  //   switch (value) {
  //     case 'user 1':
  //       break;
  //     case 'User 2':
  //       break;
  //   }
  // }
  // var on = Color(0xFFFFFFFF);
  // var off = Color(0xFF003899);
  // bool val = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kidoli',
          style: TextStyle(
            color: PrimaryColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.segment,
            color: PrimaryColor,
          ),
          onPressed: () {
            scaffoldkey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: menubar(),
      body: SafeArea(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [


              Center(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('library')

                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');

                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs;
                      return SingleChildScrollView(
                        child: Container(
                          height: size.height * 1,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: docs.length,
                            itemBuilder: (_, i) {
                              final data = docs[i].data();
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 3),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(

                                              fit: BoxFit.fitHeight,
                                              alignment: Alignment.centerLeft,
                                              image: NetworkImage(

                                                  "${data['link']}")
                                          ),
                                          color: Colors.grey,
                                          gradient: LinearGradient(
                                              colors: [
                                                gradientStart,
                                                gradientEnd
                                              ],
                                              begin: FractionalOffset(0.5, 0),
                                              end: FractionalOffset(0, 0.5),
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                        height: 150,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [

                                              Text(data['name']),
                                              Text(data['author']),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Container(
                                    //   height: 150,
                                    //   decoration: new BoxDecoration(),
                                    //   child: ListTile(
                                    //     minVerticalPadding: 20,
                                    //     horizontalTitleGap: 30.00,
                                    //     selectedColor: Colors.red,
                                    //     tileColor: Colors.grey,
                                    //     leading: Text(data['brand']),
                                    //     title: Text(
                                    //         "${data['points']}and${data['tag']}"),
                                    //     subtitle: Text(data['size']),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // checkuser() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //   userModel usermodel = userModel();
  //
  //   usermodel.email = user!.email;
  //
  //   await firebaseFirestore
  //       .collection("Customer")
  //       .doc(user.uid)
  //       .collection("subusers")
  //       .doc(user.phoneNumber)
  //       .set(usermodel.toMap());
  //   Fluttertoast.showToast(msg: "User added sucessfully");
  //
  //
  // }
}
