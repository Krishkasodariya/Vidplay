import 'dart:io';
import 'dart:math';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path/path.dart' as p;
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uri_to_file/uri_to_file.dart';

class MusicController extends GetxController {
  OnAudioQuery audioQuery = new OnAudioQuery();
  AudioPlayer audioPlayer = new AudioPlayer();
  RxList<SongModel> songs = <SongModel>[].obs;

  RxBool changeplayicon = false.obs;
  RxBool changeShuffling = false.obs;
  RxBool changeRepeating = false.obs;
  RxBool changemute = false.obs;
  RxBool clickonmusic = false.obs;
  RxBool changecontent = false.obs;
  bool isAlredyCall=true;
  RxInt sindex = 0.obs;
  RxString startposition = "".obs;
  RxString endposition = "".obs;
  RxDouble min = 0.0.obs;
  RxDouble max = 0.0.obs;


  File? file;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        print("aaaaaaaaaaaaaaaaa");
        next();
      }
    });
  }

  /*Future<void> _init() async {
    final audioFile =await
    convertUriToFile( songs[sindex.value].uri!);
    try {
      final waveFile =
      File(p.join((await getTemporaryDirectory()).path, 'waveform.wave'));
      JustWaveform.extract(audioInFile: audioFile, waveOutFile: waveFile)
          .listen(progressStream.add, onError: progressStream.addError);
    } catch (e) {

      print("e---------------------------");
      print(e);
      progressStream.addError(e);
    }
  }*/
/*
  Future<File> convertUriToFile(String uri) async {

    try {
      file = await toFile(uri); // Converting uri to file
    } on UnsupportedError catch (e) {
      print(e.message); // Unsupported error for uri not supported
    } on IOException catch (e) {
      print(e); // IOException for system error
    } catch (e) {
      print(e); // General exception
    }
    return file!;
  }
*/

  void songquery() async {
    if (songs.isEmpty) {
      await audioQuery
          .querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      )
          .then((value) {
        songs.value = value;
      });
    }
  }

  void playsong(String? uri) async {
    try {
      await audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse("${songs[sindex.value].uri}"),
              tag: MediaItem(
                id: '${songs[sindex.value].id}',
                album: '${songs[sindex.value].album}',
                title: '${songs[sindex.value].title}',
                artUri: Uri.parse("${songs[sindex.value].uri}"),
              )
          ));

      updatesong();
      if( changeplayicon.value==false){
        await audioPlayer.play();
      }

    } catch (e) {
      print("E============)${e}");
    }
  }

  void back() {
    if (sindex.value.isGreaterThan(0)) {
      sindex.value--;
    }

    //_musicController.audioPlayer.pause();
    if (sindex.value >= 0) {
      audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse("${songs[sindex.value].uri}"),
          tag: MediaItem(
            id: '${songs[sindex.value].id}',
            album: '${songs[sindex.value].album}',
            title: '${songs[sindex.value].title}',
            artUri: Uri.parse("${songs[sindex.value].uri}"),
          )
      ));
      updatesong();
      if( changeplayicon.value==false){
         audioPlayer.play();
      }
    }
  }



  Future<void> next() async {

    if(isAlredyCall) {
      if (changeShuffling == true) {
        sindex.value = Random().nextInt(songs.length);
        updatesong();
        if (changeplayicon.value == false) {
          await audioPlayer.play();
        }
      }

      if (sindex.value < songs.length - 1) {
        sindex.value++;
      }

      if (sindex.value <= songs.length) {
        isAlredyCall=false;
        await audioPlayer.setAudioSource(AudioSource.uri(
            Uri.parse("${songs[sindex.value].uri}"),
            tag: MediaItem(
              id: '${songs[sindex.value].id}',
              album: '${songs[sindex.value].album}',
              title: '${songs[sindex.value].title}',
              artUri: Uri.parse("${songs[sindex.value].uri}"),
            )
        ));
        updatesong();
        if (changeplayicon.value == false) {
          await audioPlayer.play();
        }
      }
    }else
      {
        isAlredyCall=true;
      }


  }

  void pause() async {
    await audioPlayer.pause();
    //super.dispose();
  }

  void updatesong() {
    audioPlayer.positionStream.listen((position) {
      startposition.value = position.toString().split(".")[0];
      min.value = position.inSeconds.toDouble();
    });

    audioPlayer.durationStream.listen((duration) {
      endposition.value = duration.toString().split(".")[0];
      max.value = duration!.inSeconds.toDouble();
    });
  }

  void changeseekbar(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

}
