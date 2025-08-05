import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vidplay/PlayingMusic.dart';
import 'HomeScreen.dart';
import 'package:vidplay/MusicController.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  List<Folder> folderlist = [
    Folder(title: "Download", duration: "120", image: "images/folder.png"),
    Folder(title: "My drive", duration: "60", image: "images/folder.png"),
    Folder(title: "Movie", duration: "56", image: "images/folder.png"),
    Folder(title: "April", duration: "12", image: "images/folder.png"),
    Folder(title: "May", duration: "120", image: "images/folder.png"),
    Folder(title: "June", duration: "120", image: "images/folder.png"),
    Folder(title: "July", duration: "120", image: "images/folder.png"),
    Folder(title: "August", duration: "120", image: "images/folder.png"),
    Folder(title: "Septmber", duration: "120", image: "images/folder.png"),
    Folder(title: "October", duration: "120", image: "images/folder.png"),
    Folder(title: "November", duration: "120", image: "images/folder.png"),
    Folder(title: "December", duration: "120", image: "images/folder.png"),
  ];
  MusicController musicController = Get.find();
  OnAudioQuery audioQuery = new OnAudioQuery();

  var data = 0;
  int initialLabelIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff242656),
        bottomSheet: musicController.clickonmusic.value
            ? Obx(() {
                return SingleChildScrollView(
                  child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(PlayingMusic());
                        },
                        child: Container(
                          width: double.infinity,
                          color: Color(0xff060718),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              child: Row(children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: QueryArtworkWidget(
                                    artworkBorder: BorderRadius.circular(15),
                                    artworkWidth: 65,
                                    artworkHeight: 65,
                                    nullArtworkWidget: Container(
                                      width: 65,
                                      height: 65,
                                      child: Image(
                                        image:
                                            AssetImage("images/nullmusic.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    id: musicController
                                        .songs[musicController.sindex.value].id,
                                    type: ArtworkType.AUDIO,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Text(
                                          musicController
                                              .songs[
                                                  musicController.sindex.value]
                                              .title,
                                          style: GoogleFonts.notoSansJavanese(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          musicController.changeplayicon.value =
                                              !musicController
                                                  .changeplayicon.value;
                                          if (musicController
                                              .audioPlayer.playing) {
                                            musicController.pause();
                                          } else {
                                            musicController.playsong(
                                                musicController
                                                    .songs[musicController
                                                        .sindex.value]
                                                    .uri);
                                          }
                                        },
                                        child: musicController
                                                    .changeplayicon.value ==
                                                false
                                            ? Image(
                                                image: AssetImage(
                                                    "images/pause.png"),
                                                width: 37,
                                                height: 37,
                                              )
                                            : Image(
                                                image: AssetImage(
                                                    "images/play.png"),
                                                width: 37,
                                                height: 37,
                                              )),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        musicController.clickonmusic.value =
                                            false;
                                        musicController.update();
                                        musicController.pause();
                                        setState(() {});
                                      },
                                      child: Image(
                                        image: AssetImage("images/close.png"),
                                        width: 46,
                                        height: 46,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ),
                      )),
                );
              })
            : null,
        body: Container(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("images/videoplayername.png"),
                          width: 150,
                          height: 40,
                        ),
                        Spacer(),
                        /*Row(
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
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff060718),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    musicController.changecontent.value =
                                        !musicController.changecontent.value;
                                    musicController.update();
                                  });
                                },
                                icon: musicController.changecontent.value
                                    ? Image(
                                        image:
                                            AssetImage("images/smallicon.png"),
                                        width: 22,
                                        height: 22,
                                      )
                                    : Image(
                                        image: AssetImage("images/content.png"),
                                        width: 25,
                                        height: 25,
                                      )),
                            Spacer(),
                            ToggleSwitch(
                              minWidth: 85,
                              minHeight: 38,
                              animationDuration: 1000,
                              cornerRadius: 20.0,
                              customTextStyles: [
                                TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16)
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
                              labels: ['Music', 'Folder'],
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
                          ? musicController.changecontent.value
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      width: double.infinity,
                                      child: GridView.builder(
                                        padding: EdgeInsets.only(bottom: musicController.sindex==musicController.songs.length-1?100:20),
                                        itemCount: musicController.songs.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisExtent: 110,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10),
                                        itemBuilder: (context, index) {
                                          int? milliseconds = musicController
                                              .songs[index]
                                              .duration; // Example milliseconds value

                                          Duration duration = Duration(
                                              milliseconds: milliseconds!);
                                          int minutes = duration.inMinutes;
                                          int seconds =
                                              (duration.inSeconds % 60);

                                          final formattedDuration =
                                              '$minutes:${seconds.toString().padLeft(2, '0')}';

                                          return GestureDetector(
                                            onTap: () {
                                              musicController.sindex.value =
                                                  index;
                                              musicController
                                                  .clickonmusic.value = true;
                                              musicController
                                                  .changeplayicon.value = false;
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
                                              height: 110,
                                              //margin: EdgeInsets.only(bottom:index==musicController.songs.length-1? 0:10),
                                              child: Stack(children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: QueryArtworkWidget(
                                                    artworkWidth:
                                                        double.infinity,
                                                    artworkHeight: 130,
                                                    artworkBorder:
                                                        BorderRadius.circular(
                                                            15),
                                                    nullArtworkWidget:
                                                        Container(
                                                      width: double.infinity,
                                                      height: 110,
                                                      child: Image(
                                                        image: AssetImage(
                                                            "images/nullmusic.png"),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    id: musicController
                                                        .songs[index].id,
                                                    type: ArtworkType.AUDIO,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: 50,
                                                    height: 20,
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
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
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
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 85,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child: Text(
                                                            musicController
                                                                .songs[index]
                                                                .title,
                                                            style: GoogleFonts
                                                                .notoSansJavanese(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        Spacer(),
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
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      width: double.infinity,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: musicController.songs.length,
                                        itemBuilder: (context, index) {
                                          int? milliseconds = musicController
                                              .songs[index]
                                              .duration; // Example milliseconds value

                                          Duration duration = Duration(
                                              milliseconds: milliseconds!);
                                          int minutes = duration.inMinutes;
                                          int seconds =
                                              (duration.inSeconds % 60);

                                          final formattedDuration =
                                              '$minutes:${seconds.toString().padLeft(2, '0')}';
                                          print(
                                              "-----222222-------)index${musicController.sindex.value}");
                                          return GestureDetector(
                                            onTap: () {
                                              musicController.sindex.value =
                                                  index;
                                              print(
                                                  musicController.sindex.value);
                                              musicController
                                                  .clickonmusic.value = true;
                                              musicController
                                                  .changeplayicon.value = false;
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
                                              margin: EdgeInsets.only(
                                                  bottom: index ==
                                                          musicController.songs
                                                                  .length -
                                                              1
                                                      ? 100
                                                      : 8),
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
                                                            BorderRadius
                                                                .circular(15),
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
                                                        id: musicController
                                                            .songs[index].id,
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
                                                                    .circular(
                                                                        20),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 180,
                                                        child: Text(
                                                          musicController
                                                              .songs[index]
                                                              .title,
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
                                                  padding:
                                                      const EdgeInsets.only(
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
                                      ),
                                    ),
                                  ),
                                )
                          : musicController.changecontent.value
                              ? Expanded(
                                  child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                      width: double.infinity,
                                      child: GridView.builder(
                                        padding: EdgeInsets.only(bottom: 20),
                                        itemCount: folderlist.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                mainAxisExtent: 110,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10),
                                        itemBuilder: (context, index) {
                                          return Container(
                                              height: 110,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Color(0xff242656),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Stack(children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Container(
                                                          width: 50,
                                                          height: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
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
                                                              folderlist[index]
                                                                  .duration,
                                                              style: GoogleFonts
                                                                  .notoSansJavanese(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Image(
                                                      image: AssetImage(
                                                          folderlist[index]
                                                              .image),
                                                      fit: BoxFit.cover,
                                                      width: 50,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      folderlist[index].title,
                                                      style: GoogleFonts
                                                          .notoSansJavanese(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        },
                                      )),
                                ))
                              : Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Container(
                                      width: double.infinity,
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: folderlist.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                height: 60,
                                                child: Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image(
                                                      image: AssetImage(
                                                          folderlist[index]
                                                              .image),
                                                      width: 38,
                                                      height: 38,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 7),
                                                    child: Center(
                                                      child: Text(
                                                        folderlist[index].title,
                                                        style: GoogleFonts
                                                            .notoSansJavanese(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    width: 60,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      color: Color(0xff242656),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 2),
                                                      child: Center(
                                                        child: Text(
                                                          folderlist[index]
                                                              .duration,
                                                          style: GoogleFonts
                                                              .notoSansJavanese(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff242656),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                      // SizedBox(
                      //   height: 80,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
