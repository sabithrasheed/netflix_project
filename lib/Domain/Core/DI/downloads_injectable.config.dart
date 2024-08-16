// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../Application/downloads/downloads_bloc.dart' as _i10;
import '../../../Application/fastLaugh/fast_laugh_bloc.dart' as _i11;
import '../../../Application/home/home_bloc.dart' as _i12;
import '../../../Application/hotandnew/hotandnew_bloc.dart' as _i5;
import '../../../Application/Search/search_bloc.dart' as _i13;
import '../../../HotandNew/hot_and_new_service.dart' as _i3;
import '../../../Infrastructure/Downloads/downloads_repisitory.dart' as _i7;
import '../../../Infrastructure/HotAndNew/hotandnew_imp.dart' as _i4;
import '../../../Infrastructure/Search/search_imple.dart' as _i9;
import '../../Downloads/i_downloads_repo.dart' as _i6;
import '../../Search/search_service.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplemenst());
  gh.factory<_i5.HotandnewBloc>(
      () => _i5.HotandnewBloc(get<_i3.HotAndNewService>()));
  gh.lazySingleton<_i6.IDownloadsReposit>(() => _i7.DownloadsRepository());
  gh.lazySingleton<_i8.SearchService>(() => _i9.SearchImplements());
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i6.IDownloadsReposit>()));
  gh.factory<_i11.FastLaughBloc>(
      () => _i11.FastLaughBloc(get<_i6.IDownloadsReposit>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
        get<_i6.IDownloadsReposit>(),
        get<_i8.SearchService>(),
      ));
  return get;
}
