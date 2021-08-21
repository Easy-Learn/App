import 'dart:async';
import 'dart:developer';

import 'package:tflite_audio/tflite_audio.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/widgets/custom_button.dart';
import 'package:easy_learn/view/widgets/score_board.dart';
import 'package:easy_learn/view/widgets/list_contents_box.dart';
import 'package:easy_learn/config.dart' show model, label, inputType, sampleRate, recordingLength, bufferSize;


class Content extends StatefulWidget {
  const Content({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final isRecording = ValueNotifier<bool>(false);
  Stream<Map<dynamic, dynamic>>? result;

  @override
  void initState() {
    super.initState();
    TfliteAudio.loadModel(
      // numThreads: this.numThreads,
      // isAsset: this.isAsset,
      model: model,
      label: label,
    );
  }

  void getResult() {
    result = TfliteAudio.startAudioRecognition(
      inputType: inputType,
      sampleRate: sampleRate,
      recordingLength: recordingLength,
      bufferSize: bufferSize,
    );

    result ?.listen(
      (event) => log(event.toString())
    ).onDone(() => isRecording.value = false);
  }

  String showResult(AsyncSnapshot snapshot, String key) => snapshot.hasData ? snapshot.data[key].toString() : 'null ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Map<dynamic, dynamic>>(
        stream: result,
        builder: (BuildContext context, AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
          dynamic scoreBoard;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              scoreBoard = const ScoreBoard(score: "-",);
              break;
            case ConnectionState.waiting:
              scoreBoard = const ScoreBoard(score: "-",);
              break;
            default:
              scoreBoard = ScoreBoard(score: showResult(snapshot, 'recognitionResult'),);
          }
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/content_bg.png'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0, bottom: 60.0),
                      child: CustomButton(name: 'close', size: 60.0, navigator: () {
                        Navigator.pop(context);
                      },)
                    ),
                    scoreBoard,
                    Container(
                      margin: const EdgeInsets.only(right: 10.0, bottom: 60.0),
                      child: CustomButton(name: 'sound', size: 60.0, navigator: () {},)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5.0),
                      child: CustomButton(name: 'previous', size: 100.0, navigator: () {},)
                    ),
                    const SizedBox(
                      width: 180,
                      height: 180,
                      child: ListContentsBox(
                        imagePath: 'assets/images/list_contents_animals.png',
                        title: 'Animals'
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: CustomButton(name: 'next', size: 100.0, navigator: () {})
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isRecording,
                      builder: (context, value, widget) {
                        if (value == false) {
                          return CustomButton(name: 'microphone', size: 190.0, navigator: () {
                            isRecording.value = true;
                            setState(() {
                              getResult();
                            });
                          });
                        } else {
                          return CustomButton(name: 'microphone', size: 190.0, navigator: () {
                            TfliteAudio.stopAudioRecognition();
                          });
                        }
                      }
                    )
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}