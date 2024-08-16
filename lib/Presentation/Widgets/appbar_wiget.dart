import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

class AppbarWidgetPage extends StatelessWidget {
  const AppbarWidgetPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          mwidth,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            size: 30,
            color: mwhite,
          ),
          mwidth,
          Container(
            width: 30,
            height: 30,
            color: mblue,
          ),
          mwidth
        ],
      ),
    );
  }
}
