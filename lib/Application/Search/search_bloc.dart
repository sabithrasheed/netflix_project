// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/i_downloads_repo.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Search/Models/seach_response/seach_response.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Search/search_service.dart';

import '../../Domain/Downloads/Models/downloads.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsReposit _downloadService;
  final SearchService _searchService;
  SearchBloc(
    this._downloadService,
    this._searchService,
  ) : super(SearchState.initial()) {
    // idle result_________________________
    on<Initialize>((event, emit) async {
      if (state.idlelist.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idlelist: state.idlelist,
          isloading: false,
          iserror: false,
        ));
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idlelist: [],
          isloading: true,
          iserror: false,
        ),
      );
      //go to trending______________________
      final result = await _downloadService.getDownloadsImages();
      final State = result.fold((MainFailure failure) {
        return const SearchState(
          searchResultList: [],
          idlelist: [],
          isloading: false,
          iserror: true,
        );
      }, (List<Downloads> list) {
        return SearchState(
          searchResultList: [],
          idlelist: list,
          isloading: false,
          iserror: false,
        );
      });
      //show to ui
      emit(State);
    }); // searchresult______________________
    on<searchMovies>((event, emit) async {
      //call search movie api________________

      emit(
        const SearchState(
          searchResultList: [],
          idlelist: [],
          isloading: true,
          iserror: false,
        ),
      );
      log('searching for ${event.movieQuery}');
      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      //print(_result);
      final state = result.fold(
        (MainFailure failure) {
          return const SearchState(
            searchResultList: [],
            idlelist: [],
            isloading: false,
            iserror: true,
          );
        },
        (SeachResponse response) {
          return SearchState(
            searchResultList: response.results,
            idlelist: [],
            isloading: false,
            iserror: false,
          );
        },
      );
      //show to ui____________________________
      emit(state);
    });
  }
}
