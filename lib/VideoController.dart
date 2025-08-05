import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'VideoModel.dart';

class VideoController extends GetxController {
  RxList<VideoModel> videoList = <VideoModel>[].obs;
  var vindex = 0.obs;
  var changecontenticon = false.obs;
  var filepath;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //update();
  }

  Future<void> fetchVideos() async {
    Directory directory = Directory("/storage/emulated/0/");
    //Directory directory = Directory("/storage/emulated/0/Android/data/");
    //Directory? directory = await getExternalStorageDirectory();
    print(directory);
    List<FileSystemEntity> files = directory!.listSync(recursive: true);
    for (FileSystemEntity file in files) {
      if (file is File) {
        String extension = file.path.split('.').last.toLowerCase();
        if (extension == 'mp4' ||
            extension == 'mov' ||
            extension == 'wmv' ||
            extension == 'avi' ||
            extension == 'avchd'||
            extension == 'flv' ||
            extension == 'f4v' ||
            extension == 'swf' ||
            extension == 'mkv' ||
            extension == 'webm' ||
            extension == 'html5' ||
            extension == 'mpeg-2') {
          final uint8list = await VideoThumbnail.thumbnailData(
            video: file.path,
            imageFormat: ImageFormat.PNG,
          );
          final name = path.basenameWithoutExtension(file.path);
          //print("====>${name}");
           var filepath=file.path;
          videoList.add(VideoModel(
              videoPath: filepath, videothumb: uint8list, videoname: name));
        }
      }
    }
  }


}
