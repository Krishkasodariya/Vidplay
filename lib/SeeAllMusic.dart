import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:vidplay/MusicController.dart';

import 'PlayingMusic.dart';
class SeeAllMusic extends StatefulWidget {
  const SeeAllMusic({Key? key}) : super(key: key);

  @override
  State<SeeAllMusic> createState() => _SeeAllMusicState();
}

class _SeeAllMusicState extends State<SeeAllMusic> {
  MusicController musicController=Get.find();
  var clickonmusic = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff242656),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                    child: Text("All Music",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
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
                      Expanded(
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
                                return GestureDetector(
                                  onTap: (){
                                    musicController
                                        .sindex.value = index;

                                    musicController.clickonmusic
                                        .value = true;
                                    musicController.playsong(
                                        musicController
                                            .songs[
                                        musicController
                                            .sindex
                                            .value]
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
                                              id: musicController
                                                  .songs[index]
                                                  .id,
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
                                                musicController
                                                    .songs[
                                                index]
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void changeclickonmusic() {
    clickonmusic = true;
  }
}
