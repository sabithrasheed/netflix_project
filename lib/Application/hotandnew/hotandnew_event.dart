part of 'hotandnew_bloc.dart';

@freezed
class HotandnewEvent with _$HotandnewEvent {
  const factory HotandnewEvent.loaddataincomingsoon() = Loaddataincomingsoon;
  const factory HotandnewEvent.loaddataineveryoneswatching() =
      Loaddataineveryoneswatching;
}
