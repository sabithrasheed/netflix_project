part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isLoading,
    required List<Downloads> downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsFailureOrsuccesoption,
  }) = _DownloadsState;
  factory DownloadsState.initial() {
    return const DownloadsState(
      isLoading: true,
      downloadsFailureOrsuccesoption: None(),
      downloads: [],
    );
  }
}
