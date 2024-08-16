import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/Models/downloads.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/i_downloads_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsReposit _downlodsrepo;
  DownloadsBloc(this._downlodsrepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailureOrsuccesoption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsoption =
          await _downlodsrepo.getDownloadsImages();
      log(downloadsoption.toString());
      emit(
        downloadsoption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailureOrsuccesoption: Some(
              Left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrsuccesoption: Some(
              Right(success),
            ),
          ),
        ),
      );
    });
  }
}
