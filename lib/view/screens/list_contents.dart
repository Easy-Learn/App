import 'package:flutter/material.dart';

import 'package:easy_learn/view/widgets/list_contents_box.dart';

class ListContents extends StatelessWidget {
  ListContents({Key? key}) : super(key: key);

  final List<dynamic> listContents = [
    {
        "name": "Animals"
    },
    {
        "name": "Fruits"
    },
    {
        "name": "Colors"
    },
    {
        "name": "Numbers"
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
                        imagePath: 'assets/images/list_contents_${listContents[index]["name"].toLowerCase()}.png',
                        title: listContents[index]["name"]
                      );
                    },
                  ),
                ),
              ]
            ),
        )
    );
  }
}