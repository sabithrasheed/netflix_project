import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/custom_button.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/New&Hot/Widgets/everyones_image.dart';

class NewAndHotwatchingWidegt extends StatelessWidget {
  final String posterpath;
  final String orginalname;
  final String description;
  const NewAndHotwatchingWidegt({
    Key? key,
    required this.posterpath,
    required this.orginalname,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mheight,
        Text(
          orginalname,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        aheight15,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: mgrey,
          ),
        ),
        aheight50,
        NewAndHotImage(
          everyonseurl: posterpath,
        ),
        mheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              colorchange: mgrey,
              iconsize: 25,
              textsize: 16,
            ),
            mwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              colorchange: mgrey,
              iconsize: 25,
              textsize: 16,
            ),
            mwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              colorchange: mgrey,
              iconsize: 25,
              textsize: 16,
            ),
            mwidth,
          ],
        ),
        mheight,
        Row(
          children: [
            Container(
              clipBehavior: Clip.none,
              width: 30,
              height: 30,
              child: Image.network(
                "https://cdn.vox-cdn.com/thumbor/KNlt4WzgRBrvNHS3ULQu595AL5s=/0x0:3840x2560/1200x800/filters:focal(1613x973:2227x1587)/cdn.vox-cdn.com/uploads/chorus_image/image/66267583/netflix_n_icon_logo_3840.0.jpg",
              ),
            ),
            const Text(
              "S E R I E S",
              style: TextStyle(
                color: mgrey,
                fontSize: 7,
              ),
            ),
          ],
        )
      ],
    );
  }
}
