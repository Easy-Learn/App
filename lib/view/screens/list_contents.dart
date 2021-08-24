import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'package:easy_learn/view/widgets/list_contents_box.dart';
import 'package:easy_learn/view/screens/about.dart';

class ListContents extends StatelessWidget {
  ListContents({Key? key}) : super(key: key);

  final List<dynamic> listContents = [
    {
        "name": "Chapter 1",
        "path": "chapter_1",
        "locked": false
    },
    {
        "name": "Chapter 2",
        "path": "chapter_2",
        "locked": true
    },
    {
        "name": "Chapter 3",
        "path": "chapter_3",
        "locked": true
    },
    {
        "name": "Chapter 4",
        "path": "chapter_4",
        "locked": true
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/list_contents_bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120.0),
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Easy Learn", style: TextStyle(fontSize: 45, color: Colors.white,),),
                      ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return ListContentsBox(
                        imagePath: 'assets/images/${listContents[index]["path"]}.png',
                        title: listContents[index]["name"],
                        locked: listContents[index]["locked"]
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100.0),
                  child: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const About()));
                          },
                          child: const Text("About", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
        )
    );
  }
}