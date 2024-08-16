import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/numbercard.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/main_title.dart';

class NumberWidgetCard extends StatelessWidget {
  const NumberWidgetCard({
    Key? key,
    required this.posterpath,
  }) : super(key: key);
  final List<String> posterpath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeMainTitle(
          title: "Top 10 TV Shows In India Today",
        ),
        aheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(posterpath.length, (index) {
              return HomeNUmberCard(
                index: index,
                imageurl: posterpath[index],
              );
            }),
          ),
        )
      ],
    );
  }
}
