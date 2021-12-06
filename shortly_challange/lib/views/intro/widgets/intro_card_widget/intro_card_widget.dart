import 'package:flutter/material.dart';
import 'package:shortly_challange/core/app/constants.dart';

class IntroCardWidget extends StatelessWidget {
  String assetImagePath;
  Widget cardBody;

  IntroCardWidget({
    Key? key,
    required this.assetImagePath,
    required this.cardBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 42.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 0,
            child: Container(
              height: 300,
              padding:
                  EdgeInsets.only(bottom: 48, top: 48, left: 24, right: 24),
              child: cardBody,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, -0.1),
            child: Align(
              child: CircleAvatar(
                backgroundColor: purpleColor,
                radius: 40.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    assetImagePath,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
