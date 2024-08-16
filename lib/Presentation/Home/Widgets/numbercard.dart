import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

class HomeNUmberCard extends StatelessWidget {
  const HomeNUmberCard({
    super.key,
    required this.index,
    required this.imageurl,
  });
  final int index;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: mradius,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        imageurl,
                      ))),
            ),
          ],
        ),
        Positioned(
          bottom: -30,
          left: 20,
          child: BorderedText(
            strokeColor: mwhite,
            strokeWidth: 10.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: mblack,
                decoration: TextDecoration.none,
                decorationColor: mblack,
                fontSize: 130,
              ),
            ),
          ),
        )
      ],
    );
  }
}
