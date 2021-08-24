import 'package:flutter/material.dart';

class ContentBox extends StatefulWidget {
  const ContentBox({Key? key, required this.imagePath, required this.title}) : super(key: key);

  final String imagePath;
  final String title;

  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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
                  image: AssetImage(widget.imagePath)
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
                  Text(widget.title, style: const TextStyle(fontSize: 20, color: Colors.white),)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}