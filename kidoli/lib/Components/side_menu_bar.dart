// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/Constant_var.dart';


class menubar extends StatelessWidget {
  const menubar({Key? key}) : super(key: key);
  // void customLaunch(command) async {
  //   if (await canLaunch(command)) {
  //     await launch(command);
  //   } else {
  //     print('Could not launch $command');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('usermail@gmail.com'),
            // currentAccountPicture: CircleAvatar(
            //   child: ClipOval(
            //     child: Image.asset(
            //       "assets/images/pp.jpg",
            //       color: PrimaryColor,
            //       fit: BoxFit.cover,
            //       width: 90,
            //       height: 90,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: PrimaryColor,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  //sample cover photo
                  image: NetworkImage(
                      'https://image.shutterstock.com/image-vector/red-abstract-background-vector-modern-260nw-788330542.jpg')),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text('8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )), //notification count
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Payment method',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: PrimaryColor,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.star_border_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Rate Us',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.share_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Share',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.power_settings_new_outlined,
              color: PrimaryColor,
            ),
            title: Text(
              'Log out',
              style: TextStyle(
                color: PrimaryColor,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
