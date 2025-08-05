import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vidplay/Playingvideo.dart';
import 'package:vidplay/VideoController.dart';
import 'HomeScreen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
/*  List<Videos> videolist = [
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
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
    Videos(
        title: "All in my mind...",
        duration: "10:30",
        image: "images/girl.png"),
  ];*/
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
  VideoController videoController = Get.find();
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
          body: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 10),
                  child: Container(
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage("images/videoplayername.png"),
                            width: 150,
                            height: 40,
                          ),
                   /*       Spacer(),
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
                            children: [

                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      videoController.changecontenticon.value =
                                          !videoController
                                              .changecontenticon.value;
                                    });
                                  },
                                  icon: videoController.changecontenticon.value
                                      ? Image(
                                          image: AssetImage(
                                              "images/smallicon.png"),
                                          width: 22,
                                          height: 22,
                                        )
                                      : Image(
                                          image:
                                              AssetImage("images/content.png"),
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
                                labels: ['Video', 'Folder'],
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
                            ? videoController.changecontenticon.value
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Container(
                                          width: double.infinity,
                                          child: Obx(()=>GridView.builder(
                                            padding: EdgeInsets.only(bottom: 20),
                                              itemCount: videoController
                                                  .videoList.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisExtent: 110,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10),
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  width: double.infinity,
                                                  height: 110,
                                                  child: Stack(children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15)),
                                                      child: Image(
                                                        image: MemoryImage(
                                                            videoController.videoList[index].videothumb!),
                                                        fit: BoxFit.cover,
                                                        height: 110,
                                                        width: double.infinity,
                                                      ),
                                                    ),
                                                /*    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                        width: 50,
                                                        height: 20,
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
                                                            "120",
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
                                                    ),*/
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          videoController.vindex.value= index;
                                                          Get.to(Playingvideo(),arguments:videoController.videoList[videoController.vindex.value].videoPath);

                                                        },
                                                        child: Image(
                                                          image: AssetImage(
                                                              "images/playvideoblack.png"),
                                                          fit: BoxFit.cover,
                                                          width: 40,
                                                          height: 40,
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 8,
                                                                right: 8),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 85,
                                                              margin: EdgeInsets.only(bottom: 5),
                                                              child: Text(
                                                                videoController
                                                                    .videoList[
                                                                index]
                                                                    .videoname!,
                                                                style: GoogleFonts
                                                                    .notoSansJavanese(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10,
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
                                                );
                                              },
                                            ),
                                          )),
                                    ),
                                  )
                                : Expanded(
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
                            : videoController.changecontenticon.value
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  color: Color(0xff242656),
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Stack(children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topRight,
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
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                folderlist[
                                                                        index]
                                                                    .duration,
                                                                style: GoogleFonts.notoSansJavanese(
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
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          },
                                        ),),
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
                                                          folderlist[index]
                                                              .title,
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
                                                        color:
                                                            Color(0xff242656),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 2),
                                                        child: Center(
                                                          child: Text(
                                                            folderlist[index]
                                                                .duration,
                                                            style: GoogleFonts
                                                                .notoSansJavanese(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
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
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

}
