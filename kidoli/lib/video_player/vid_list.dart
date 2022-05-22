// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kidoli/video_player/video_items.dart';
import 'package:video_player/video_player.dart';
import '../Constant/Constant_var.dart';

var scaffoldkey = GlobalKey<ScaffoldState>();

class vid_list extends StatefulWidget {
  const vid_list({Key? key}) : super(key: key);

  @override
  _vid_listState createState() => _vid_listState();
}

class _vid_listState extends State<vid_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
      ChewieListItem(

      // This URL doesn't exist - will display an error
      videoPlayerController: VideoPlayerController.network(
      'https://www.youtube.com/watch?v=XP-4BiWsuaQ',
      ), looping: true,
      
      ),
          ChewieListItem(
            // This URL doesn't exist - will display an error
            videoPlayerController: VideoPlayerController.network(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
            ), looping: false,

          ),



        ]
      ),
    );
  }
}
