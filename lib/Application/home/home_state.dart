part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearmovielist,
    required List<HotAndNewData> trendingmovielist,
    required List<HotAndNewData> tensedramasmovielist,
    required List<HotAndNewData> southindianmovielist,
    required List<HotAndNewData> top10tvlist,
    required bool hasloading,
    required bool haserror,
  }) = _Initial;
  factory HomeState.initial() {
    return const HomeState(
      stateId: "0",
      pastYearmovielist: [],
      trendingmovielist: [],
      tensedramasmovielist: [],
      southindianmovielist: [],
      top10tvlist: [],
      hasloading: false,
      haserror: false,
    );
  }
}
