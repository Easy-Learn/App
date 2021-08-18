import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: const AssetImage('assets/images/about_bg.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : const [
                Text("About", style: TextStyle(fontSize: 40.0, color: Colors.white),)
              ]
            ),
            Column(
              children: [
                const Text("Developed by : ", style: TextStyle(fontSize: 25.0, color: Colors.white),),
                Container(
                  padding: const EdgeInsets.only(left: 100.0),
                  alignment: Alignment.centerLeft,
                  child: const Text("- Michael William Jonathan", style: TextStyle(fontSize: 15.0, color: Colors.white),)
                ),
                Container(
                  padding: const EdgeInsets.only(left: 100.0),
                  alignment: Alignment.centerLeft,
                  child: const Text("- Kelvin Samuel", style: TextStyle(fontSize: 15.0, color: Colors.white),)
                ),
                Container(
                  padding: const EdgeInsets.only(left: 100.0),
                  alignment: Alignment.centerLeft,
                  child: const Text("- Hans Edison", style: TextStyle(fontSize: 15.0, color: Colors.white),)
                ),
              ],
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
        ),
      )
    );
  }
}