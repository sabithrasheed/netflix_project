import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';

class EveryoneVideoWidget extends StatelessWidget {
  final String comingsoonurl;
  const EveryoneVideoWidget({
    required this.comingsoonurl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            comingsoonurl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: mblack.withOpacity(
              0.5,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off_rounded,
                  color: mwhite,
                  size: 25,
                )),
          ),
        )
      ],
    );
  }
}
