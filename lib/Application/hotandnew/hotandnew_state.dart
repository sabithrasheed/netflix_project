part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List<HotAndNewData> comingsoonlist,
    required List<HotAndNewData> eveyoneswatchinglist,
    required bool hasloading,
    required bool haserror,
  }) = _Initial;
  factory HotandnewState.initial() {
    return const HotandnewState(
      comingsoonlist: [],
      eveyoneswatchinglist: [],
      hasloading: false,
      haserror: false,
    );
  }
}
