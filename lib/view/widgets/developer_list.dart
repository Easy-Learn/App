import 'package:flutter/material.dart';

class DeveloperList extends StatelessWidget {
  const DeveloperList({Key? key, required this.imagePath, required this.dragging}) : super(key: key);

  final String imagePath;
  final bool dragging;

  @override
  Widget build(BuildContext context) {
    return (dragging) ? Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
          image: AssetImage('assets/images/developers/$imagePath.png')
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0))
      ),
    ) : Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/developers/$imagePath.png')
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50.0))
      ),
    );
  }
}