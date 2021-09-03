import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperBox extends StatelessWidget {
  const DeveloperBox({Key? key, required this.imagePath, required this.name, required this.telegram}) : super(key: key);

  final String imagePath;
  final String name;
  final String telegram;

  void telegramChat() async {
    await canLaunch(telegram) ? await launch(telegram) : throw 'Could not launch $telegram';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/developers/$imagePath.png'),
                fit: BoxFit.contain
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0))
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        telegramChat();
                      },
                      child: const Icon(Icons.chat)
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}