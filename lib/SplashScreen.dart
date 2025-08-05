import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vidplay/BottomNavigationBar.dart';
import 'package:vidplay/MusicController.dart';
import 'package:vidplay/VideoController.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoController videoController = Get.find();
  MusicController musicController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestStoragePermission();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset("images/splashscreen.png", fit: BoxFit.cover),
      ),
    );
  }

  void requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    print("11111111111111111");
    if (status.isDenied) {
      print("22222222222222222");
      PermissionStatus newStatus = await Permission.storage.request();

      if (newStatus.isGranted) {
        print("3333333333333333");
        Timer(Duration(seconds: 5), () => Get.off(BottomNavigationScreen()));
      }
      else {
        print("4444444444444444444");
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
                onPressed: () async{
                  print("55555555555555555555");
                  PermissionStatus checkstatus = await Permission.storage.status;
                  setState(() {
                    if(checkstatus.isGranted){
                      print("6666666666666666666666");
                      Navigator.pop(context);
                      Timer(Duration(seconds: 5), () => Get.off(BottomNavigationScreen()));
                    }else{
                      print("77777777777777777777");
                      openAppSettings();
                    }
                  });
                },
                child: Text("OK"),
              ),
            ],
          ),
        );

      }
    } else if (status.isGranted) {
      print("88888888888888888888");
      Timer(Duration(seconds: 5), () => Get.off(BottomNavigationScreen()));
    } else if (status.isPermanentlyDenied) {
      print("999999999999999999");
      openAppSettings();
    }
  }

}
// Timer(Duration(seconds: 5), () => Get.off(BottomNavigationScreen()));