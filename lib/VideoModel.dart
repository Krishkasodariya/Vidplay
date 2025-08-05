import 'dart:typed_data';

class VideoModel{

  String? videoPath;
  String? videoname;
  String? duration;
  Uint8List? videothumb;
  VideoModel({this.duration, this.videoname, this.videoPath, this.videothumb});
}