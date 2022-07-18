import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  YoutubePlayerController? youtubePlayerController;
  String? id;
  String? iv;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String im = ModalRoute.of(context)!.settings.arguments as String;
    setvideo(im);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Song",
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 400,
                  child: YoutubePlayer(controller: youtubePlayerController!),
                ),
              ],
            )),
      ),
    );
  }

  void setvideo(String im) {
    id = YoutubePlayer.convertUrlToId(im);

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: id!,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }
}
