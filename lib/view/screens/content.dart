import 'dart:async';
import 'dart:developer';

import 'package:tflite_audio/tflite_audio.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/widgets/custom_button.dart';
import 'package:easy_learn/view/widgets/score_board.dart';
import 'package:easy_learn/view/widgets/content_box.dart';
import 'package:easy_learn/config.dart' show model, label, inputType, numOfInferences, sampleRate, recordingLength, bufferSize, detectionThreshold;


class Content extends StatefulWidget {
  const Content({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final isRecording = ValueNotifier<bool>(false);
  Stream<Map<dynamic, dynamic>>? result;

  int counter = 0;

  final List<dynamic> contents = [
    {
      "title": "yes",
    },
    {
      "title": "no",
    },
    {
      "title": "up",
    },
    {
      "title": "down",
    },
    {
      "title": "left",
    },
    {
      "title": "right",
    },
    {
      "title": "on",
    },
    {
      "title": "off",
    },
    {
      "title": "stop",
    },
    {
      "title": "go",
    },
  ];

  void next() {
    setState(() {
      counter++;
    });
  }

  void previous() {
    setState(() {
      counter--;
    });
  }

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
      numOfInferences: numOfInferences,
      sampleRate: sampleRate,
      recordingLength: recordingLength,
      bufferSize: bufferSize,
      detectionThreshold: detectionThreshold
    );

    result ?.listen(
      (event) => log(event.toString())
    ).onDone(() => isRecording.value = false);
  }

  String showResult(AsyncSnapshot snapshot, String key) {
    if (snapshot.hasData) {
      return snapshot.data[key].toString();
    }
    return '-';
  }

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
              scoreBoard = ScoreBoard(score: showResult(snapshot, 'recognitionResult') == contents[counter]["title"] ? showResult(snapshot, 'inferenceTime') : '-',);
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 60.0),
                      child: CustomButton(name: 'close', size: 60.0, navigator: () {
                        Navigator.pop(context);
                      },)
                    ),
                    scoreBoard,
                    Container(
                      margin: const EdgeInsets.only(bottom: 60.0),
                      child: CustomButton(name: 'sound', size: 60.0, navigator: () {},)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(name: 'previous', size: 100.0, navigator: () {
                      if (counter != 0) {
                        previous();
                      }
                    },),
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: ContentBox(
                        imagePath: 'assets/images/content_${contents[counter]["title"]}.png',
                        title: contents[counter]["title"]
                      ),
                    ),
                    CustomButton(name: 'next', size: 100.0, navigator: () {
                      if (counter != 9) {
                        next();
                      }
                    })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isRecording,
                      builder: (context, value, widget) {
                        if (value == false) {
                          return CustomButton(name: 'microphone', size: 170.0, navigator: () {
                            isRecording.value = true;
                            setState(() {
                              getResult();
                            });
                          });
                        } else {
                          return CustomButton(name: 'microphone', size: 170.0, navigator: () {
                            TfliteAudio.stopAudioRecognition();
                          });
                        }
                      }
                    )
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}