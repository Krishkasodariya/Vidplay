import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'VideoController.dart';

class Playingvideo extends StatefulWidget {
  const Playingvideo({Key? key}) : super(key: key);

  @override
  State<Playingvideo> createState() => _PlayingvideoState();
}

class _PlayingvideoState extends State<Playingvideo> {
  var getdata = Get.arguments;
  VideoController videoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:YoYoPlayer(
           aspectRatio: 16 / 9,
            url: getdata,
            videoStyle: VideoStyle(
              playIcon: Image.asset("images/play.png",width: 35,height: 35,),
              pauseIcon: Image.asset("images/pause.png",width: 35,height: 35,),
              backwardIcon: Image.asset("images/back.png",width: 18,height: 18,),
              forwardIcon:  Image.asset("images/next.png",width: 18,height: 18,),
            ),
            videoLoadingStyle: VideoLoadingStyle(
              loadingIndicatorBgColor: Color(0xffffffff),
              loadingBackgroundColor: Color(0xffffffff),
              loadingIndicatorValueColor:  Color(0xff060718),
            ),
            autoPlayVideoAfterInit: true,
            displayFullScreenAfterInit: true,

          )
          ),
    );
  }
}

