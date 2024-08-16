import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/HotandNew/hot_and_new_service.dart';

import '../../HotandNew/Models/new_and_hot_response.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeservice;
  HomeBloc(this.homeservice)
      : super(
          HomeState.initial(),
        ) {
    //ON Event Get HomeScreenData****************************************

    on<GetHomescreenData>(
      (event, emit) async {
        log("GetHomescreenData");
        //Send Load To UI******************************************************
        emit(
          state.copyWith(
            hasloading: true,
            haserror: false,
          ),
        );
        //Get Data*********************************************************
        final movieresult = await homeservice.getHotAndNewMovieData();

        final tvresult = await homeservice.getHotAndNewTvData();
//Transform Data***********************************************
        final state1 = movieresult.fold((MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearmovielist: [],
            trendingmovielist: [],
            tensedramasmovielist: [],
            southindianmovielist: [],
            top10tvlist: [],
            hasloading: false,
            haserror: true,
          );
        }, (NewAndHotResponse response) {
          final pastyearlist = response.results;
          final trendinglist = response.results;
          final tensedramaslist = response.results;
          final southindianlist = response.results;
          pastyearlist.shuffle();
          trendinglist.shuffle();
          tensedramaslist.shuffle();
          southindianlist.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearmovielist: pastyearlist,
            trendingmovielist: trendinglist,
            tensedramasmovielist: tensedramaslist,
            southindianmovielist: southindianlist,
            top10tvlist: state.top10tvlist,
            hasloading: false,
            haserror: false,
          );
        });
        emit(state1);
        final state2 = tvresult.fold((MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearmovielist: [],
            trendingmovielist: [],
            tensedramasmovielist: [],
            southindianmovielist: [],
            top10tvlist: [],
            hasloading: false,
            haserror: true,
          );
        }, (NewAndHotResponse response) {
          final top10list = response.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearmovielist: state.pastYearmovielist,
            trendingmovielist: state.tensedramasmovielist,
            tensedramasmovielist: state.tensedramasmovielist,
            southindianmovielist: state.southindianmovielist,
            top10tvlist: top10list,
            hasloading: false,
            haserror: false,
          );
        });
        emit(state2);
        // Send To UI***************************************************
      },
    );
  }
}
