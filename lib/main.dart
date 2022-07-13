import 'package:flutter/material.dart';
import 'package:musicapp/screen/introscreen.dart';
import 'package:musicapp/screen/login_s.dart';
import 'package:musicapp/screen/loginpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Intro_screen(),
        'login':(context)=>Login_Screen(),
        'login1':(context)=>Login_s(),
      },
    ),
  );
}
