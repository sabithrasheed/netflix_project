// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Application/fastLaugh/fast_laugh_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/Models/downloads.dart';
import 'package:video_player/video_player.dart';
import '../../../Core/const_values.dart';

class VideoPlayerInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads moviedata;

  const VideoPlayerInheritedWidget({
    super.key,
    required this.widget,
    required this.moviedata,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoPlayerInheritedWidget oldWidget) {
    return oldWidget.moviedata != moviedata;
  }

  static VideoPlayerInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoPlayerInheritedWidget>();
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final int index;
  const VideoPlayerWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final posterpath =
        VideoPlayerInheritedWidget.of(context)?.moviedata.posterPath;
    final videourl = dummyvideourls[index % dummyvideourls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videourl: videourl,
          // ignore: avoid_types_as_parameter_names
          onStatechanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //leftside
                CircleAvatar(
                    radius: 25,
                    backgroundColor: mblack.withOpacity(
                      0.5,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off_rounded,
                        color: mwhite,
                        size: 30,
                      ),
                    )),

                //rightside

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: posterpath == null
                            ? null
                            : NetworkImage(
                                "$imageappendurl$posterpath",
                              ),
                      ),
                    ),
                    ValueListenableBuilder(
                        valueListenable: likedvideosnotifier,
                        builder: (BuildContext context,
                            Set<int> newlikedlistids, Widget? _) {
                          final Index = index;

                          if (newlikedlistids.contains(Index)) {
                            return GestureDetector(
                              onTap: () {
                                likedvideosnotifier.value.remove(Index);

                                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                likedvideosnotifier.notifyListeners();
                                //  BlocProvider.of<FastLaughBloc>(context)
                                //    .add(Unlikedvideos(id: _index));
                              },
                              child: const VideoItemActions(
                                icon: Icons.favorite_outline,
                                title: 'Liked',
                              ),
                            );
                          }
                          return GestureDetector(
                            onTap: () {
                              likedvideosnotifier.value.add(Index);
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              likedvideosnotifier.notifyListeners();
                              // BlocProvider.of<FastLaughBloc>(context)
                              //   .add(Likedvideos(id: _index));
                            },
                            child: const VideoItemActions(
                              icon: Icons.emoji_emotions,
                              title: 'unliked',
                            ),
                          );
                        }),
                    const VideoItemActions(
                      icon: Icons.add,
                      title: 'My list',
                    ),
                    const VideoItemActions(
                      icon: Icons.share,
                      title: 'Share',
                    ),
                    const VideoItemActions(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoItemActions extends StatelessWidget {
  const VideoItemActions({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: mwhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: mwhite,
            ),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videourl;
  final void Function(bool isplaying) onStatechanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videourl, required this.onStatechanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videourl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
