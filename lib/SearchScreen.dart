import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vidplay/MusicController.dart';
import 'package:vidplay/VideoController.dart';
import 'HomeScreen.dart';
import 'PlayingMusic.dart';
import 'Playingvideo.dart';
import 'VideoModel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Videos> videolist = [
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "09:22",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "16:45",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "05:31",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "09:05",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "12:27",
        image: "images/girl.png"),
  ];
  MusicController musicController = Get.find();
  VideoController videoController = Get.find();
  var initialLabelIndex = 0;
  var data = 0;
  late List<SongModel> foundmusic;
  late List<VideoModel> foundvideo;
  var textcontroller = TextEditingController();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    foundmusic = musicController.songs;
    foundvideo = videoController.videoList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060718),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xff242656)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: textcontroller,
                      onChanged: (value) {
                        onsearchmusic(value);
                        onsearchvideo(value);
                      },
                      cursorColor: Color(0xffc4c4c4),
                      decoration: InputDecoration(
                        icon: Image(
                          image: AssetImage("images/search_none.png"),
                          width: 45,
                          height: 45,
                          color: Colors.white,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text("Searching for",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    Spacer(),
                    ToggleSwitch(
                      minWidth: 85,
                      minHeight: 38,
                      animationDuration: 1000,
                      cornerRadius: 20.0,
                      customTextStyles: [
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                      ],
                      activeBgColors: [
                        [Color(0xff242656)],
                        [Color(0xff242656)]
                      ],
                      activeFgColor: Colors.blue,
                      inactiveBgColor: Colors.black,
                      inactiveFgColor: Colors.grey,
                      initialLabelIndex: initialLabelIndex,
                      totalSwitches: 2,
                      labels: ['Video', 'Music'],
                      radiusStyle: true,
                      onToggle: (index) {
                        setState(() {
                          data = index!;
                          initialLabelIndex = index!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              data == 0
                  ? textcontroller.text.isEmpty
                      ? Expanded(
                        child: Center(
                          child: Container(
                              child: Lottie.asset('images/lotti_empty.json',
                                  width: 150, height: 150)),
                        ),
                      )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: double.infinity,
                              child: foundvideo.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: foundvideo.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          height: 65,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            color: Color(0xff242656),
                                          ),
                                          child: Row(children: [
                                            Stack(
                                              alignment: Alignment.topRight,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: Image(
                                                    image: MemoryImage(
                                                        foundvideo[index]
                                                            .videothumb!),
                                                    fit: BoxFit.cover,
                                                    width: 65,
                                                    height: 65,
                                                  ),
                                                ),
                                                /*    Container(
                                                        width: 53,
                                                        height: 18,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15)),
                                                          color: Colors.black,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "130",
                                                            style: GoogleFonts
                                                                .notoSansJavanese(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                        ),
                                                      )*/
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 180,
                                                    child: Text(
                                                      foundvideo[index]
                                                          .videoname!,
                                                      style: GoogleFonts
                                                          .notoSansJavanese(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                videoController.vindex.value =
                                                    index;
                                                Get.to(Playingvideo(),
                                                    arguments: videoController
                                                        .videoList[
                                                            videoController
                                                                .vindex.value]
                                                        .videoPath);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/playvideoblack.png"),
                                                  fit: BoxFit.cover,
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          ]),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                        "No Data Found",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                            ),
                          ),
                        )
                  : textcontroller.text.isEmpty
                      ? Expanded(
                child: Center(
                  child: Container(
                      child: Lottie.asset('images/lotti_empty.json',
                          width: 150, height: 150)),
                ),
              )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: double.infinity,
                              child: foundmusic.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: foundmusic.length,
                                      itemBuilder: (context, index) {
                                        int? milliseconds = musicController
                                            .songs[index]
                                            .duration; // Example milliseconds value

                                        Duration duration = Duration(
                                            milliseconds: milliseconds!);
                                        int minutes = duration.inMinutes;
                                        int seconds = (duration.inSeconds % 60);

                                        final formattedDuration =
                                            '$minutes:${seconds.toString().padLeft(2, '0')}';
                                        return GestureDetector(
                                          onTap: () {
                                            musicController.sindex.value = index;

                                            musicController.clickonmusic.value =
                                                true;
                                            musicController.playsong(
                                                musicController
                                                    .songs[musicController
                                                        .sindex.value]
                                                    .uri);
                                            musicController.update();
                                            Get.to(PlayingMusic());
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8),
                                            height: 65,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              color: Color(0xff242656),
                                            ),
                                            child: Row(children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    child: QueryArtworkWidget(
                                                      artworkBorder:
                                                          BorderRadius.circular(
                                                              15),
                                                      artworkWidth: 65,
                                                      artworkHeight: 65,
                                                      nullArtworkWidget:
                                                          Container(
                                                        width: 65,
                                                        height: 65,
                                                        child: Image(
                                                          image: AssetImage(
                                                              "images/nullmusic.png"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      id: foundmusic[index].id,
                                                      type: ArtworkType.AUDIO,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 45,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15)),
                                                      color: Colors.black,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        formattedDuration,
                                                        style: GoogleFonts
                                                            .notoSansJavanese(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 180,
                                                      child: Text(
                                                        foundmusic[index].title,
                                                        style: GoogleFonts
                                                            .notoSansJavanese(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Image(
                                                      image: AssetImage(
                                                          "images/music-white.png"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Text(
                                        "No Data Found",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                            ),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }

  void onsearchmusic(String value) {
    List<SongModel> resultmusic = [];

    if (value.isEmpty) {
      Container();
    } else {
      resultmusic = musicController.songs
          .where((p0) => p0.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundmusic = resultmusic;
    });
  }

  void onsearchvideo(String value) {
    List<VideoModel> resultvideo = [];
    if (value.isEmpty) {
      Container();
    } else {
      resultvideo = videoController.videoList
          .where(
              (p0) => p0.videoname!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundvideo = resultvideo;
    });
  }
}
