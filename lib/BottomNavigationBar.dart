import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vidplay/MusicController.dart';
import 'package:vidplay/MusicScreen.dart';
import 'package:vidplay/SearchScreen.dart';
import 'package:vidplay/VideoController.dart';
import 'package:vidplay/VideoScreen.dart';

import 'HomeScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  var _selectedIndex = 0;
  List pages = [HomeScreen(), SearchScreen(), VideoScreen(), MusicScreen()];
  MusicController musicController = Get.find();
  VideoController videoController=Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.fetchVideos();
    musicController.songquery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 65,
        color: Color(0xff060718),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            elevation: 0,

            currentIndex: _selectedIndex,
            backgroundColor: Color(0xff242656),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? Image.asset(
                          "images/home_active.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "images/home_none.png",
                          width: 50,
                          height: 50,
                        ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? Image.asset(
                          "images/search_active.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "images/search_none.png",
                          width: 50,
                          height: 50,
                        ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? Image.asset(
                          "images/video_active.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "images/video_none.png",
                          width: 50,
                          height: 50,
                        ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 3
                      ? Image.asset(
                          "images/music_active.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "images/music_none.png",
                          width: 50,
                          height: 50,
                        ),
                  label: "Search")
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
/*  Future<void> _requestStoragePermission() async {
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
                    openAppSettings();
                  }
                    if (status) {
                      Navigator.pop(context);
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
