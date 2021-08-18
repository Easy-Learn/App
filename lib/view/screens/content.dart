import 'package:easy_learn/view/widgets/list_contents_box.dart';
import 'package:easy_learn/view/widgets/score_board.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/widgets/custom_button.dart';

class Content extends StatefulWidget {
  const Content({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                const ScoreBoard(),
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
                CustomButton(name: 'microphone', size: 190.0, navigator: () {},)
              ],
            ),
          ],
        ),
      ),
    );
  }
}