import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vidplay/BottomNavigationBar.dart';
import 'package:vidplay/SplashScreen.dart';
import 'HomeScreen.dart';
import 'MusicController.dart';
import 'VideoController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Get.put(VideoController());
   Get.put(MusicController());
   JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //    SystemUiOverlay.top,
  //  ]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xff060718)));


  runApp(GetMaterialApp(
    home: Myapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SplashScreen(),

      ),
    );
  }
 /* Future<void> _requestStoragePermission() async {
    PermissionStatus permission = await Permission.storage.request();
    bool status = await permission.isGranted;
    setState(() {
      if (permission != PermissionStatus.granted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            title: Text("Storage permission required"),
            content: Text(
                "This app requires storage permission to function properly."),
            actions: [
              TextButton(
                onPressed: () {
                  if (!status) {
                    if (status) {
                      Navigator.pop(context);
                    }
                    openAppSettings();
                  }
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }*/
}
