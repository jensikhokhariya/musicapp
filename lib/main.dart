import 'package:flutter/material.dart';
import 'package:musicapp/screen/introscreen.dart';
import 'package:musicapp/screen/login_s.dart';
import 'package:musicapp/screen/loginpage.dart';
import 'package:musicapp/screen/song_p.dart';
import 'package:musicapp/screen/song_s.dart';
import 'package:musicapp/screen/video_s.dart';
import 'package:musicapp/screen/videos.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Intro_screen(),
        'login':(context)=>Login_Screen(),
        'login1':(context)=>Login_s(),
        'song':(context)=>Song_Screen(),
        'videos':(context)=>Video_Image(),
        'video':(context)=>Videos(),
        'song1':(context)=>Song_Screen(),
        'spngp':(context)=>Song_S(),

      },
    ),
  );
}
