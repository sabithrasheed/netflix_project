import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconsize = 30,
      this.textsize = 20,
      required this.colorchange})
      : super(key: key);
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;
  final dynamic colorchange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: mwhite,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textsize, color: colorchange),
        )
      ],
    );
  }
}
