import 'package:flutter/material.dart';

import 'package:shortly_challange/core/app/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  Widget childWidget;
  Function() onPress;
  Color? backgroundColor;
  CustomButtonWidget({
    Key? key,
    required this.childWidget,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all<Color>(backgroundColor!)
              : MaterialStateProperty.all<Color>(primaryColor)),
      onPressed: onPress,
      child: childWidget,
    );
  }
}
