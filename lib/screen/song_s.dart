import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/data.dart';

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
  Imagelist? l1;



  @override
  void initState() {
    super.initState();
    audio1(audiolink!);

    print("=============== $audiolink");

  }

  void audio1(String path) async{
     await assetsAudioPlayer.open(
       Audio(path),
      autoStart: false,
      showNotification: true,
    );
    assetsAudioPlayer.current.listen((event) {
      tdu = event!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    l1 = ModalRoute.of(context)!.settings.arguments as Imagelist;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Now playing",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
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
                    "${l1!.imgs}",
                    fit: BoxFit.cover,
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
                      "${l1!.imgs}",
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
                    "${l1!.nm}",
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
                  height: 600,
                  width: 300,
                  alignment: Alignment.bottomCenter,
                  child: PlayerBuilder.currentPosition(
                      player: assetsAudioPlayer,
                      builder: (context, duration) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Slider(
                              activeColor: Colors.black,
                              inactiveColor: Colors.white,
                              value: duration.inSeconds.toDouble(),
                              max: tdu.inSeconds.toDouble(),
                              onChanged: (value) {
                                assetsAudioPlayer.seek(Duration(seconds: value.toInt()));

                                Text("=============> $cdu");
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

  void playaudio() async{


    if (isplay == false) {
      await assetsAudioPlayer.play();
      setState(() {
        isplay = true;
        iconmusic = Icon(Icons.pause_circle_outline,);
      });
    } else {
      assetsAudioPlayer.pause();
      setState(() {
        isplay = false;
        iconmusic = Icon(Icons.play_circle_outline);
      });
    }
  }
}
