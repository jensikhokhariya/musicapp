import 'package:flutter/material.dart';
import 'package:musicapp/data.dart';
import 'package:musicapp/screen/model.dart';

class Song_Screen extends StatefulWidget {
  const Song_Screen({Key? key}) : super(key: key);

  @override
  State<Song_Screen> createState() => _Song_ScreenState();
}

class _Song_ScreenState extends State<Song_Screen> {
  List imgs = [
    "assets/images/bb1.webp",
    "assets/images/bp.jpeg",
    "assets/images/jj.webp",
    "assets/images/gangubai.jpeg",
    "assets/images/kgfch22.webp",
    "assets/images/mitra.jpeg",
    "assets/images/nacho.jpeg",
    "assets/images/pushpa1.jpeg",
    "assets/images/rait.jpeg",
    "assets/images/vij.webp",
  ];
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

  List nm = [
    "Bhool Bhulaiyaa 2",
    "Bachchan Pandey",
    "Jayeshbhai Jordar",
    "Gangubai",
    "K.G.F 2",
    "Runway 34",
    "RRR",
    "Pushpa",
    "Atarangi Re",
    "Beast"
  ];

  List c1 = [
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.green.shade900,
    Colors.green,
    Colors.lightGreen,
    Colors.orange,
    Colors.deepOrange,
    Colors.redAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Songs"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: c1.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Imagelist l2 = Imagelist(nm[index], imgs[index], songlist[index]);
                  audiolink = songlist[index];

                  Navigator.pushNamed(context, 'spngp', arguments: l2);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: c1[index],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "${imgs[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${nm[index]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Spacer(),
                        Icon(
                          Icons.play_circle,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
