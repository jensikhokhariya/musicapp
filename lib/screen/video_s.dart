import 'package:flutter/material.dart';

class Video_Image extends StatefulWidget {
  const Video_Image({Key? key}) : super(key: key);

  @override
  _Video_ImageState createState() => _Video_ImageState();
}

class _Video_ImageState extends State<Video_Image> {
  List<dynamic> img = [
    "assets/images/bb.jpeg",
    "assets/images/bp.jpeg",
    "assets/images/jj.webp",
    "assets/images/gangubai.jpeg",
    "assets/images/kgf2.jpeg",
    "assets/images/mitra.jpeg",
    "assets/images/nacho.jpeg",
    "assets/images/pushpa.jpeg",
    "assets/images/rait.jpeg",
    "assets/images/vij.webp",
  ];
  List video = [
    "https://www.youtube.com/watch?v=J1rOfVst-EQ",
    "https://www.youtube.com/watch?v=1Daf3HwOHus",
    "https://www.youtube.com/watch?v=GX6T2c6QH4Q",
    "https://www.youtube.com/watch?v=uv9Dv6fzg9w",
    "https://www.youtube.com/watch?v=zR5-HbFW6hc",
    "https://www.youtube.com/watch?v=qpoVa9B7tNc",
    "https://www.youtube.com/watch?v=sAzlWScHTc4",
    "https://www.youtube.com/watch?v=hcMzwMrr1tE",
    "https://www.youtube.com/watch?v=aOliIfyH6vI",
    "https://www.youtube.com/watch?v=6GxykI-ahzQ"
  ];

  List name = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video player"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: GridView.builder(
          itemCount: img.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (context, index) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'video',
                      arguments: video[index]);
                },
                child: Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 350,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            img[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${name[index]}",
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
