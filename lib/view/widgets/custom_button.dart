import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.name, required this.size, required this.navigator}) : super(key: key);

  final String name;
  final double size;
  final Function() navigator;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isTap = true;
        });
      },
      onTapDown: (x) {
        setState(() {
          isTap = false;
        });
        widget.navigator();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: isTap ? widget.size - 10 : widget.size,
        height: isTap ? widget.size - 10 : widget.size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/buttons/${widget.name}.png'),
          )
        ),
      ),
    );
  }
}