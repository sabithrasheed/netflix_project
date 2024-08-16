import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Application/fastLaugh/fast_laugh_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Fast%20Laughs/Widgets/video_play_widget.dart';

class FastLaughScreen extends StatelessWidget {
  const FastLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
          },
          child: BlocBuilder<FastLaughBloc, FastLaughState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                ));
              } else if (state.iserror) {
                return const Center(
                    child: Text(
                  " Error While Getting data",
                ));
              } else if (state.videosList.isEmpty) {
                return const Center(
                  child: Text(
                    "Video List Empty",
                  ),
                );
              } else {
                return PageView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(state.videosList.length, (index) {
                    return VideoPlayerInheritedWidget(
                        widget: VideoPlayerWidget(
                          key: Key(index.toString()),
                          index: index,
                        ),
                        moviedata: state.videosList[index]);
                  }),
                );
              }
            },
          ),
        ),
      )),
    );
  }
}
