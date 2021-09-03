import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:easy_learn/view/widgets/developer_box.dart';
import 'package:easy_learn/view/widgets/developer_list.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isAccepted = false;
  int state = 0;

  final List<dynamic> developers = [
    {
      "name": "Michael William Jonathan",
      "image": "michael",
      "telegram": "https://t.me/moepoi"
    },
    {
      "name": "Kelvin Samuel",
      "image": "kelvin",
      "telegram": "https://t.me/CoganUntar"
    },
    {
      "name": "Hans Edison",
      "image": "hans",
      "telegram": "https://t.me/Takahashi18"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: const AssetImage('assets/images/about_bg.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Draggable<int>(
                  data: 0,
                  child: DeveloperList(imagePath: developers[0]['image'], dragging: false),
                  childWhenDragging: const SizedBox.shrink(),
                  feedback: DeveloperList(imagePath: developers[0]['image'], dragging: true),
                ),
                Draggable<int>(
                  data: 1,
                  child: DeveloperList(imagePath: developers[1]['image'], dragging: false),
                  childWhenDragging: const SizedBox.shrink(),
                  feedback: DeveloperList(imagePath: developers[1]['image'], dragging: true),
                ),
                Draggable<int>(
                  data: 2,
                  child: DeveloperList(imagePath: developers[2]['image'], dragging: false),
                  childWhenDragging: const SizedBox.shrink(),
                  feedback: DeveloperList(imagePath: developers[2]['image'], dragging: true),
                )
              ],
            ),
            DragTarget<int>(
              onWillAccept: (value) => true,
              onAccept: (value) {isAccepted = true; state = value;},
              builder: (context, candidates, rejected) {
                return (isAccepted) ? DeveloperBox(
                  imagePath: developers[state]['image'],
                  name: developers[state]['name'],
                  telegram: developers[state]['telegram']
                ) : Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(50.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: const Center(
                    child: Text('DRAG PROFILE PICTURE ABOVE TO HERE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  )
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Close", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
                )
              ]
            ),
          ],
        )
      ),
    );
  }
}