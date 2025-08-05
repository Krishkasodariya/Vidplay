import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vidplay/MusicController.dart';
import 'package:vidplay/PlayingMusic.dart';

import 'Playingvideo.dart';
import 'SeeAllMusic.dart';
import 'SeeAllVideo.dart';
import 'VideoController.dart';
//com.example.video_player.MainActivity
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Videos {
  late String title;
  late String duration;
  late String image;

  Videos({required this.title, required this.duration, required this.image});
}

class Folder {
  late String title;
  late String duration;
  late String image;

  Folder({required this.title, required this.duration, required this.image});
}

class _HomeScreenState extends State<HomeScreen> {
  VideoController videoController = Get.find();
  MusicController musicController = Get.find();
  OnAudioQuery audioQuery = new OnAudioQuery();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060718),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                  child: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("images/videoplayername.png"),
                            width: 150,
                          ),
                          /*Spacer(),
                          Row(
                            children: [
                              Image(
                                image: AssetImage("images/refresh.png"),
                                width: 26,
                                height: 26,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Image(
                                image: AssetImage("images/setting.png"),
                                width: 26,
                                height: 26,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Image(
                                image: AssetImage("images/menu.png"),
                                width: 26,
                                height: 26,
                              )
                            ],
                          )*/
                        ],
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/videoplayer_bk.png"))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Welcome to",
                                  style: GoogleFonts.notoSansJavanese(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                child: Image(
                                  image: AssetImage("images/textname.png"),
                                  width: 170,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image(
                            image:
                                AssetImage("images/videoplayer_whiteicon.png"),
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Videos",
                          style: GoogleFonts.notoSansJavanese(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 80,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff242656),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: GestureDetector(
                              onTap: (){
                               Get.to(SeeAllVideo());
                              },
                              child: Text(
                                "See all",
                                style: GoogleFonts.notoSansJavanese(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    child: Obx(()=> ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: videoController.videoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 18, left: 5),
                            child: Container(
                              width: 185,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Image(
                                    image: MemoryImage(videoController
                                        .videoList[index]
                                        .videothumb!),
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 160,
                                  ),
                                ),
                            /*    Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 60,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topRight: Radius.circular(15)),
                                      color: Colors.black,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "102",
                                        style: GoogleFonts.notoSansJavanese(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),*/
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      videoController.vindex.value = index;
                                      Get.to(Playingvideo(),
                                          arguments: videoController.videoList[videoController.vindex.value].videoPath);
                                    },
                                    child: Image(
                                      image: AssetImage("images/playvideoblack.png"),
                                      fit: BoxFit.cover,
                                      width: 42,
                                      height: 42,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 12, right: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 130,
                                          child: Text(
                                            videoController
                                                .videoList[
                                            index]
                                                .videoname!,
                                            style: GoogleFonts.notoSansJavanese(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Music",
                          style: GoogleFonts.notoSansJavanese(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 80,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xff242656),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: GestureDetector(
                              onTap: (){
                                Get.to(SeeAllMusic());
                              },
                              child: Text(
                                "See all",
                                style: GoogleFonts.notoSansJavanese(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: musicController.songs.length,
                      itemBuilder: (context, index) {
                        int? milliseconds = musicController.songs[index].duration; // Example milliseconds value

                        Duration duration = Duration(milliseconds: milliseconds!);
                        int minutes = duration.inMinutes;
                        int seconds = (duration.inSeconds % 60);

                        final formattedDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';

                        return Padding(
                          padding: const EdgeInsets.only(right: 18, left: 5),
                          child: Container(
                            width: 185,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                child: QueryArtworkWidget(
                                  artworkWidth: 185,
                                  artworkHeight: 160,
                                  artworkBorder: BorderRadius.circular(15),
                                  nullArtworkWidget: Container(
                                    width: 185,
                                    height: 160,
                                    child: Image(
                                      image: AssetImage("images/nullmusic.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  id: musicController.songs[index].id,
                                  type: ArtworkType.AUDIO,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 60,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topRight: Radius.circular(15)),
                                    color: Colors.black,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Center(
                                      child: Text(
                                        formattedDuration,
                                        style: GoogleFonts.notoSansJavanese(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    musicController.sindex.value = index;
                                    musicController.clickonmusic.value=true;
                                    musicController.playsong(musicController.songs[musicController.sindex.value].uri);
                                    musicController.update();
                                    Get.to(PlayingMusic());
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image(
                                        image: AssetImage(
                                            "images/music-white.png"),
                                        fit: BoxFit.cover,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, right: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 140,
                                        child: Text(
                                          musicController.songs[index].title,
                                          style: GoogleFonts.notoSansJavanese(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
