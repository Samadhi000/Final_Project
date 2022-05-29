// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/side_menu_bar.dart';
import '../Constant/Constant_var.dart';

var scaffoldkey = GlobalKey<ScaffoldState>();

class home_main extends StatefulWidget {
  const home_main({Key? key}) : super(key: key);

  @override
  _home_mainState createState() => _home_mainState();
}

class _home_mainState extends State<home_main> {
  // final List<Widget> imgList = [
  //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: menubar(),
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
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Container(
              height: 180,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: false,
                childAspectRatio: 1 / 0.3,
                mainAxisSpacing: 7,
                crossAxisSpacing: 8,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red[100]),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.icecream,
                            color: Colors.red,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[100]),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.icecream,
                            color: Colors.blue,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.green[100]),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.icecream,
                            color: Colors.green,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.yellow[100]),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.icecream,
                            color: Colors.yellow,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(color: Colors.yellow),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2 / 1,
                enlargeCenterPage: true,
              ),
              items: [
                Image(image: AssetImage('assets/slide.jpg')),
                Image(image: AssetImage('assets/slide1.jpg'))
              ],
            ),
          )
        ],
      )),
    );
  }
}
