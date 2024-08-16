import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({
    Key? key,
    required this.imageurl,
  }) : super(key: key);
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 140,
      height: 380,
      decoration: BoxDecoration(
          borderRadius: mradius,
          image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                imageurl,
              ))),
    );
  }
}
