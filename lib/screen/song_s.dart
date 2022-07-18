import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class Song_S extends StatefulWidget {
  const Song_S({Key? key}) : super(key: key);

  @override
  State<Song_S> createState() => _Song_SState();
}

class _Song_SState extends State<Song_S> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isplay = false;
  Icon iconmusic = Icon(Icons.play_circle_outline);
  Duration tdu = Duration(seconds: 0);
  Duration cdu = Duration(seconds: 0);

  List songlist = [
    "assets/music/bb.mp3",
    "assets/music/bp.mp3",
    "assets/music/jj.mp3",
    "assets/music/gangubai.mp3",
    "assets/music/kgf2.mp3",
    "assets/music/mitra.mp3",
    "assets/music/rrr.mp3",
    "assets/music/pushpa.mp3",
    "assets/music/atrangire.mp3",
    "assets/music/beast.mp3",
  ];

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("assets/music/bb.mp3"),
      autoStart: false,
      showNotification: false,
    );
    assetsAudioPlayer.current.listen((event) {
      tdu = event!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    Imagelist l1 = ModalRoute.of(context)!.settings.arguments as Imagelist;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    "${l1.imgs}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "${l1.imgs}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 400,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "${l1.nm}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 500,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      onPressed: () {
                        playaudio();
                      },
                      icon: iconmusic),
                ),
              ),
              Center(
                child: Container(
                  height: 700,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: PlayerBuilder.currentPosition(
                      player: assetsAudioPlayer,
                      builder: (context, duration) {
                        return Column(
                          children: [
                            Slider(
                              activeColor: Colors.blue,
                              inactiveColor: Colors.blue.shade200,
                              thumbColor: Colors.lightBlue,
                              value: duration.inSeconds.toDouble(),
                              max: tdu.inSeconds.toDouble(),
                              onChanged: (value) {
                                assetsAudioPlayer
                                    .seek(Duration(seconds: value.toInt()));
                              },
                            ),
                            Text("$duration/$tdu",style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void playaudio() {
    if (isplay == false) {
      assetsAudioPlayer.play();
      setState(() {
        isplay = false;
        iconmusic = Icon(Icons.pause_circle_outline);
      });
    } else {
      assetsAudioPlayer.pause();
      setState(() {
        isplay = true;
        iconmusic = Icon(Icons.play_circle_outline);
      });
    }
  }
}
