import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/HotandNew/hot_and_new_service.dart';

import '../../HotandNew/Models/new_and_hot_response.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(
    this._hotAndNewService,
  ) : super(
          HotandnewState.initial(),
        ) {
    on<Loaddataincomingsoon>((event, emit) async {
      //Send Loading To UI
      emit(const HotandnewState(
        comingsoonlist: [],
        eveyoneswatchinglist: [],
        hasloading: true,
        haserror: false,
      ));
      //Get Data From Remote
      final result = await _hotAndNewService.getHotAndNewMovieData();
      //Data to state
      final newstate = result.fold((MainFailure failure) {
        return const HotandnewState(
          comingsoonlist: [],
          eveyoneswatchinglist: [],
          hasloading: false,
          haserror: true,
        );
      }, (NewAndHotResponse response) {
        return HotandnewState(
          comingsoonlist: response.results,
          eveyoneswatchinglist: state.eveyoneswatchinglist,
          hasloading: false,
          haserror: false,
        );
      });
      emit(newstate);
    });

    on<Loaddataineveryoneswatching>((event, emit) async {
      emit(const HotandnewState(
        comingsoonlist: [],
        eveyoneswatchinglist: [],
        hasloading: true,
        haserror: false,
      ));
      //Get Data From Remote
      final result = await _hotAndNewService.getHotAndNewTvData();
      //Data to state
      final newstate = result.fold((MainFailure failure) {
        return const HotandnewState(
          comingsoonlist: [],
          eveyoneswatchinglist: [],
          hasloading: false,
          haserror: true,
        );
      }, (NewAndHotResponse response) {
        return HotandnewState(
          comingsoonlist: state.comingsoonlist,
          eveyoneswatchinglist: response.results,
          hasloading: false,
          haserror: false,
        );
      });
      emit(newstate);
    });
  }
}
