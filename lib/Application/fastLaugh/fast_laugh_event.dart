part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likedvideos({
    required int id,
  }) = Likedvideos;
  const factory FastLaughEvent.unlikedvideos({
    required int id,
  }) = Unlikedvideos;
}
