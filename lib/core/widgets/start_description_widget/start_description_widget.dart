import 'package:flutter/material.dart';

import 'package:shortly_challange/core/app/constants.dart';

class StartDescriptionWidget extends StatelessWidget {
  String titleText;
  String descriptionText;
  double? descriptionWidth;
  double? titleWidth;
  double? titleFontSize;
  double? descriptionFontSize;
  int? titleMaxLines;
  int? descriptionMaxLines;

  StartDescriptionWidget({
    Key? key,
    required this.titleText,
    required this.descriptionText,
    this.descriptionWidth,
    this.titleWidth,
    this.titleFontSize,
    this.descriptionFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: titleWidth,
          child: Text(
            titleText,
            maxLines: titleMaxLines,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkColor,
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: descriptionWidth ?? descriptionWidth,
          child: Text(
            descriptionText,
            overflow: TextOverflow.clip,
            maxLines: descriptionMaxLines,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkColor,
              fontSize: descriptionFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
