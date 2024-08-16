import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../Domain/Downloads/Models/downloads.dart';
import '../../Domain/Downloads/i_downloads_repo.dart';
part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyvideourls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
];
ValueNotifier<Set<int>> likedvideosnotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsReposit downloadsService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //Sending loading to UI
      emit(
        const FastLaughState(
          videosList: [],
          isloading: true,
          iserror: false,
        ),
      );
      //Get trending movies
      final result = await downloadsService.getDownloadsImages();
      final state = result.fold(
        (l) => const FastLaughState(
          videosList: [],
          isloading: false,
          iserror: true,
        ),
        (response) => FastLaughState(
          videosList: response,
          isloading: false,
          iserror: false,
        ),
      );
      //Show to UI
      emit(state);
    });
    on<Likedvideos>((event, emit) async {
      likedvideosnotifier.value.add(event.id);
    });
    on<Unlikedvideos>((event, emit) async {
      likedvideosnotifier.value.remove(event.id);
    });
  }
}
