import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/custom_button.dart';

class BackGroundWidgetCard extends StatelessWidget {
  const BackGroundWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    mmainimage,
                  ))),
          width: double.infinity,
          height: 600,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  colorchange: mwhite,
                  title: "My List",
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(
                  colorchange: mwhite,
                  icon: Icons.info,
                  title: "Info",
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          mwhite,
        )),
        icon: const Icon(
          Icons.play_arrow,
          color: mblack,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 20,
              color: mblack,
            ),
          ),
        ));
  }
}
