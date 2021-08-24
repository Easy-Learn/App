import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/screens/content.dart';

class ListContentsBox extends StatelessWidget {
  const ListContentsBox({Key? key, required this.imagePath, required this.title, required this.locked}) : super(key: key);

  final String imagePath;
  final String title;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (!locked) {
          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const Content(category: 'chapter 1')));
        }
      },
      child: Banner(
        location: BannerLocation.topEnd,
        message: locked == false ? "Unlocked" : "Locked",
        color: locked == false ? Colors.green.withOpacity(0.6) : Colors.red.withOpacity(0.6),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
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
      ),
    );
  }
}