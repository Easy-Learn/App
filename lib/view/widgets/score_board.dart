import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key, required this.score}) : super(key: key);

  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/content_score_board.png'),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(score, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}