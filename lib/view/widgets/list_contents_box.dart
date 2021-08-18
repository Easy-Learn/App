import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/screens/content.dart';

class ListContentsBox extends StatelessWidget {
  const ListContentsBox({Key? key, required this.imagePath, required this.title}) : super(key: key);

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const Content(category: 'None')));
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(25.0))
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath)
                )
              ),
              width: 300,
              height: 300,
            ),
            SizedBox.expand(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, color: Colors.white),)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}