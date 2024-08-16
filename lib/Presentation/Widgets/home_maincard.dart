import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/main_card.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/main_title.dart';

class HomeMainTitleCard extends StatelessWidget {
  const HomeMainTitleCard({
    Key? key,
    required this.posterpath,
    required this.title,
  }) : super(
          key: key,
        );
  final List<String> posterpath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeMainTitle(title: title),
        aheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterpath.length, (index) {
              return HomeMainCard(
                imageurl: posterpath[index],
              );
            }),
          ),
        )
      ],
    );
  }
}
