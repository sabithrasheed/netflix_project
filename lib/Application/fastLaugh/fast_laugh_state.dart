part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videosList,
    required bool isloading,
    required bool iserror,
  }) = _Initial;
  factory FastLaughState.initial() => const FastLaughState(
        videosList: [],
        isloading: true,
        iserror: false,
      );
}
