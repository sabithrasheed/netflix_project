import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/custom_button.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/everyone_video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String moviename;
  final String description;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterpath,
    required this.moviename,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 45,
          height: 480,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 16,
                  color: mgrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 45,
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EveryoneVideoWidget(
                comingsoonurl: posterpath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      moviename,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        letterSpacing: -2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const CustomButtonWidget(
                    icon: Icons.notifications,
                    title: "Remind me",
                    colorchange: mgrey,
                    iconsize: 20,
                    textsize: 12,
                  ),
                  mwidth,
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: "Info",
                    colorchange: mgrey,
                    iconsize: 20,
                    textsize: 12,
                  ),
                  mwidth,
                ],
              ),
              aheight,
              Text(
                "Coming On $month$day",
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
                    "F I L M",
                    style: TextStyle(
                      color: mgrey,
                      fontSize: 7,
                    ),
                  ),
                  aheight15,
                ],
              ),
              Text(
                moviename,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              aheight15,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: mgrey,
                ),
              ),
            ],
          ),
        ),
        aheight15
      ],
    );
  }
}
