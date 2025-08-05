import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidplay/VideoController.dart';
import 'Playingvideo.dart';

class SeeAllVideo extends StatefulWidget {
  const SeeAllVideo({Key? key}) : super(key: key);

  @override
  State<SeeAllVideo> createState() => _SeeAllVideoState();
}

class _SeeAllVideoState extends State<SeeAllVideo> {
  VideoController videoController = Get.find();
  var data = 0;
  int initialLabelIndex = 0;

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
                  child: Text("All Videos",
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10),
                          child: Container(
                            width: double.infinity,
                            child: Obx(()=> ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount:
                              videoController.videoList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                  EdgeInsets.only(bottom: 10),
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
                                          child: Image(
                                            image: MemoryImage(
                                                videoController
                                                    .videoList[
                                                index]
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
                                      padding:
                                      const EdgeInsets.only(
                                          left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 180,
                                            child: Text(
                                              videoController
                                                  .videoList[
                                              index]
                                                  .videoname!,
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
                                    GestureDetector(
                                      onTap: () {
                                        videoController.vindex.value= index;
                                        Get.to(Playingvideo(),arguments:videoController.videoList[videoController.vindex.value].videoPath);

                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10),
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
                            ),
                            ),
                          ),
                        ),
                      )
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
}
