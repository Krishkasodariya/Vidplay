import 'dart:math';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:audio_wave/audio_wave.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_waveform/just_waveform.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'package:vidplay/MusicController.dart';
import 'package:vidplay/test.dart';

class PlayingMusic extends StatefulWidget {
  PlayingMusic({Key? key}) : super(key: key);

  @override
  State<PlayingMusic> createState() => _PlayingMusicState();
}

class _PlayingMusicState extends State<PlayingMusic> {
  MusicController musicController = Get.find();
  RecorderController controller = RecorderController();
  final progressStream = BehaviorSubject<WaveformProgress>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060718),
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Obx(
                        () => Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: QueryArtworkWidget(
                              artworkBorder: BorderRadius.circular(15),
                              // artworkWidth: 80,
                              // artworkHeight: 80,
                              nullArtworkWidget: Container(
                                // width: 80,
                                // height: 80,
                                child: Image(
                                  image: AssetImage("images/nullmusic.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              id: musicController
                                  .songs[musicController.sindex.value].id,
                              type: ArtworkType.AUDIO,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Color(0xff242656).withOpacity(0.9),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Image(
                                      image: AssetImage("images/backarrow.png"),
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  Spacer(),
                                  Image(
                                    image: AssetImage("images/share.png"),
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(width: 22),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        musicController.changemute.value =
                                            !musicController.changemute.value;

                                        if (musicController.changemute.value ==
                                            true) {
                                          musicController.audioPlayer
                                              .setVolume(0);
                                        } else {
                                          musicController.audioPlayer
                                              .setVolume(50);
                                        }
                                      },
                                      child: musicController.changemute.value
                                          ? Image(
                                              image:
                                                  AssetImage("images/mute.png"),
                                              width: 25,
                                              height: 25,
                                            )
                                          : Image(
                                              image: AssetImage(
                                                  "images/sound.png"),
                                              width: 25,
                                              height: 25,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        child: QueryArtworkWidget(
                                          artworkBorder:
                                              BorderRadius.circular(15),
                                          artworkWidth: 200,
                                          artworkHeight: 200,
                                          nullArtworkWidget: Container(
                                            width: 200,
                                            height: 200,
                                            child: Image(
                                              image: AssetImage(
                                                  "images/nullmusic.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          id: musicController
                                              .songs[
                                                  musicController.sindex.value]
                                              .id,
                                          type: ArtworkType.AUDIO,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 200,
                                        child: Center(
                                          child: Text(
                                            musicController
                                                .songs[musicController
                                                    .sindex.value]
                                                .title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 180,
                                        child: Center(
                                          child: Text(
                                            "${musicController.songs[musicController.sindex.value].artist}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Obx(
                      () => Row(
                        children: [
                          Text(musicController.startposition.value,
                              style: TextStyle(color: Colors.white)),
                          Spacer(),
                          Expanded(
                            flex: 10,
                            child: Slider(
                              min: Duration(seconds: 0).inSeconds.toDouble(),
                              max: musicController.max.value,
                              value: musicController.min.value,
                              onChanged: (newValue) {
                                musicController.changeseekbar(newValue.toInt());
                                newValue = newValue;
                              },
                            ),
                          ),
                          Spacer(),
                          Text(musicController.endposition.value,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  /* Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      ),

                      child: StreamBuilder<WaveformProgress>(
                        stream: progressStream,
                        builder: (context, snapshot) {
                          print("error==){snapshot.error}");
                          final progress = snapshot.data?.progress ?? 0.0;
                          final waveform = snapshot.data?.waveform;
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(

                                'Error: ${snapshot.error}',
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                          if (waveform == null) {
                            return Center(
                              child: Text(
                                '${(100 * progress).toInt()}%',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          }
                          return AudioWaveformWidget(
                            waveform: waveform,
                            start: Duration.zero,
                            duration: waveform.duration,
                          );
                        },
                      ),
                    ),
                  ),*/
                  SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            musicController.changeShuffling.value =
                                !musicController.changeShuffling.value;
                            if (musicController.changeShuffling.value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Shuffle On"),
                                    duration: Duration(milliseconds: 1500),
                                    behavior: SnackBarBehavior.floating,
                                    width: 100,
                                    backgroundColor:Color(0xff242656),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 5,));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Shuffle Off"),
                                    duration: Duration(milliseconds: 1500),
                                    behavior: SnackBarBehavior.floating,
                                    width: 100,
                                    backgroundColor:Color(0xff242656),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 5,));
                            }
                          },
                          child: Image(
                            image: musicController.changeShuffling.value
                                ? AssetImage("images/shuffle_active.png")
                                : AssetImage("images/shuffle_none.png"),
                            width: 25,
                            height: 25,
                          ),
                        ),
                        Obx(
                          () => Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  musicController.back();
                                },
                                child: Image(
                                  image: AssetImage("images/back_none.png"),
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    musicController.changeplayicon.value =
                                        !musicController.changeplayicon.value;
                                    if (musicController.audioPlayer.playing) {
                                      musicController.pause();
                                    } else {
                                      musicController.playsong(musicController
                                          .songs[musicController.sindex.value]
                                          .uri);
                                    }
                                  },
                                  child: musicController.changeplayicon.value ==
                                          false
                                      ? Image(
                                          image: AssetImage("images/pause.png"),
                                          width: 60,
                                          height: 60,
                                        )
                                      : Image(
                                          image: AssetImage("images/play.png"),
                                          width: 60,
                                          height: 60,
                                        )),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  musicController.isAlredyCall = true;
                                  await musicController.next();
                                  musicController.isAlredyCall = true;
                                },
                                child: Image(
                                  image: AssetImage("images/next_none.png"),
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            musicController.changeRepeating.value =
                                !musicController.changeRepeating.value;
                            if (musicController.changeRepeating.value == true) {
                              musicController.audioPlayer
                                  .setLoopMode(LoopMode.all);
                            } else {
                              musicController.audioPlayer
                                  .setLoopMode(LoopMode.off);
                            }
                            if (musicController.changeRepeating.value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Repeat On"),
                                    duration: Duration(milliseconds: 1500),
                                    behavior: SnackBarBehavior.floating,
                                    width: 100,
                                    backgroundColor:Color(0xff242656),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 5,));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text("Repeat Off"),
                                    duration: Duration(milliseconds: 1500),
                                    behavior: SnackBarBehavior.floating,
                                    width: 100,
                                    backgroundColor:Color(0xff242656),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20)),
                                    elevation: 5,));
                            }
                          },
                          child: Image(
                            image: musicController.changeRepeating.value
                                ? AssetImage("images/repeat_active.png")
                                : AssetImage("images/repeat_none.png"),
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/*class AudioWaveformWidget extends StatefulWidget {
  final Color waveColor;
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Waveform waveform;
  final Duration start;
  final Duration duration;

  const AudioWaveformWidget({
    Key? key,
    required this.waveform,
    required this.start,
    required this.duration,
    this.waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  }) : super(key: key);

  @override
  _AudioWaveformState createState() => _AudioWaveformState();
}

class _AudioWaveformState extends State<AudioWaveformWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: AudioWaveformPainter(
          waveColor: widget.waveColor,
          waveform: widget.waveform,
          start: widget.start,
          duration: widget.duration,
          scale: widget.scale,
          strokeWidth: widget.strokeWidth,
          pixelsPerStep: widget.pixelsPerStep,
        ),
      ),
    );
  }
}

class AudioWaveformPainter extends CustomPainter {
  final double scale;
  final double strokeWidth;
  final double pixelsPerStep;
  final Paint wavePaint;
  final Waveform waveform;
  final Duration start;
  final Duration duration;

  AudioWaveformPainter({
    required this.waveform,
    required this.start,
    required this.duration,
    Color waveColor = Colors.blue,
    this.scale = 1.0,
    this.strokeWidth = 5.0,
    this.pixelsPerStep = 8.0,
  }) : wavePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round
    ..color = waveColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (duration == Duration.zero) return;

    double width = size.width;
    double height = size.height;

    final waveformPixelsPerWindow = waveform.positionToPixel(duration).toInt();
    final waveformPixelsPerDevicePixel = waveformPixelsPerWindow / width;
    final waveformPixelsPerStep = waveformPixelsPerDevicePixel * pixelsPerStep;
    final sampleOffset = waveform.positionToPixel(start);
    final sampleStart = -sampleOffset % waveformPixelsPerStep;
    for (var i = sampleStart.toDouble();
    i <= waveformPixelsPerWindow + 1.0;
    i += waveformPixelsPerStep) {
      final sampleIdx = (sampleOffset + i).toInt();
      final x = i / waveformPixelsPerDevicePixel;
      final minY = normalise(waveform.getPixelMin(sampleIdx), height);
      final maxY = normalise(waveform.getPixelMax(sampleIdx), height);
      canvas.drawLine(
        Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
        Offset(x + strokeWidth / 2, min(height - strokeWidth * 0.75, maxY)),
        wavePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) {
    return false;
  }

  double normalise(int s, double height) {
    if (waveform.flags == 0) {
      final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
      return height - 1 - y * height / 65536;
    } else {
      final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
      return height - 1 - y * height / 256;
    }
  }*/
}
