import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro_screen extends StatefulWidget {
  const Intro_screen({Key? key}) : super(key: key);

  @override
  State<Intro_screen> createState() => _Intro_screenState();
}

class _Intro_screenState extends State<Intro_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "High Quality audio",
              image: Center(
                child: Image.asset("assets/images/music1.png",height: 300,),
              ),
              body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            ),
            PageViewModel(
                title: "podcasts",
                image: Center(
                  child: Image.asset("assets/images/music2.png",height: 300,),
                ),
                body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            ),
            PageViewModel(
                title: "Huge music store",
                image: Center(
                  child: Image.asset("assets/images/music3.png",height: 300,),
                ),
                body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            ),
          ],
          showSkipButton: true,
          skip: Text("skip"),
          done: Text("Done"),
          onDone: (){
            Navigator.pushNamed(context, 'login');
          },
          next: Icon(Icons.arrow_forward),
          onChange: (position){},
        ),
      ),
    );
  }
}
