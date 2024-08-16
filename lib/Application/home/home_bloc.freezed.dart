// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomescreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomescreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomescreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomescreenData value) getHomescreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomescreenData value)? getHomescreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomescreenData value)? getHomescreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomescreenDataCopyWith<$Res> {
  factory _$$GetHomescreenDataCopyWith(
          _$GetHomescreenData value, $Res Function(_$GetHomescreenData) then) =
      __$$GetHomescreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomescreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomescreenData>
    implements _$$GetHomescreenDataCopyWith<$Res> {
  __$$GetHomescreenDataCopyWithImpl(
      _$GetHomescreenData _value, $Res Function(_$GetHomescreenData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomescreenData implements GetHomescreenData {
  const _$GetHomescreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomescreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomescreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomescreenData,
  }) {
    return getHomescreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomescreenData,
  }) {
    return getHomescreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomescreenData,
    required TResult orElse(),
  }) {
    if (getHomescreenData != null) {
      return getHomescreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomescreenData value) getHomescreenData,
  }) {
    return getHomescreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomescreenData value)? getHomescreenData,
  }) {
    return getHomescreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomescreenData value)? getHomescreenData,
    required TResult orElse(),
  }) {
    if (getHomescreenData != null) {
      return getHomescreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomescreenData implements HomeEvent {
  const factory GetHomescreenData() = _$GetHomescreenData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<HotAndNewData> get pastYearmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tensedramasmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southindianmovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get top10tvlist => throw _privateConstructorUsedError;
  bool get hasloading => throw _privateConstructorUsedError;
  bool get haserror => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearmovielist,
      List<HotAndNewData> trendingmovielist,
      List<HotAndNewData> tensedramasmovielist,
      List<HotAndNewData> southindianmovielist,
      List<HotAndNewData> top10tvlist,
      bool hasloading,
      bool haserror});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearmovielist = null,
    Object? trendingmovielist = null,
    Object? tensedramasmovielist = null,
    Object? southindianmovielist = null,
    Object? top10tvlist = null,
    Object? hasloading = null,
    Object? haserror = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearmovielist: null == pastYearmovielist
          ? _value.pastYearmovielist
          : pastYearmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovielist: null == trendingmovielist
          ? _value.trendingmovielist
          : trendingmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensedramasmovielist: null == tensedramasmovielist
          ? _value.tensedramasmovielist
          : tensedramasmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southindianmovielist: null == southindianmovielist
          ? _value.southindianmovielist
          : southindianmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      top10tvlist: null == top10tvlist
          ? _value.top10tvlist
          : top10tvlist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      hasloading: null == hasloading
          ? _value.hasloading
          : hasloading // ignore: cast_nullable_to_non_nullable
              as bool,
      haserror: null == haserror
          ? _value.haserror
          : haserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      List<HotAndNewData> pastYearmovielist,
      List<HotAndNewData> trendingmovielist,
      List<HotAndNewData> tensedramasmovielist,
      List<HotAndNewData> southindianmovielist,
      List<HotAndNewData> top10tvlist,
      bool hasloading,
      bool haserror});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? pastYearmovielist = null,
    Object? trendingmovielist = null,
    Object? tensedramasmovielist = null,
    Object? southindianmovielist = null,
    Object? top10tvlist = null,
    Object? hasloading = null,
    Object? haserror = null,
  }) {
    return _then(_$_Initial(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      pastYearmovielist: null == pastYearmovielist
          ? _value._pastYearmovielist
          : pastYearmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingmovielist: null == trendingmovielist
          ? _value._trendingmovielist
          : trendingmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensedramasmovielist: null == tensedramasmovielist
          ? _value._tensedramasmovielist
          : tensedramasmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southindianmovielist: null == southindianmovielist
          ? _value._southindianmovielist
          : southindianmovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      top10tvlist: null == top10tvlist
          ? _value._top10tvlist
          : top10tvlist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      hasloading: null == hasloading
          ? _value.hasloading
          : hasloading // ignore: cast_nullable_to_non_nullable
              as bool,
      haserror: null == haserror
          ? _value.haserror
          : haserror // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.stateId,
      required final List<HotAndNewData> pastYearmovielist,
      required final List<HotAndNewData> trendingmovielist,
      required final List<HotAndNewData> tensedramasmovielist,
      required final List<HotAndNewData> southindianmovielist,
      required final List<HotAndNewData> top10tvlist,
      required this.hasloading,
      required this.haserror})
      : _pastYearmovielist = pastYearmovielist,
        _trendingmovielist = trendingmovielist,
        _tensedramasmovielist = tensedramasmovielist,
        _southindianmovielist = southindianmovielist,
        _top10tvlist = top10tvlist;

  @override
  final String stateId;
  final List<HotAndNewData> _pastYearmovielist;
  @override
  List<HotAndNewData> get pastYearmovielist {
    if (_pastYearmovielist is EqualUnmodifiableListView)
      return _pastYearmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearmovielist);
  }

  final List<HotAndNewData> _trendingmovielist;
  @override
  List<HotAndNewData> get trendingmovielist {
    if (_trendingmovielist is EqualUnmodifiableListView)
      return _trendingmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingmovielist);
  }

  final List<HotAndNewData> _tensedramasmovielist;
  @override
  List<HotAndNewData> get tensedramasmovielist {
    if (_tensedramasmovielist is EqualUnmodifiableListView)
      return _tensedramasmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tensedramasmovielist);
  }

  final List<HotAndNewData> _southindianmovielist;
  @override
  List<HotAndNewData> get southindianmovielist {
    if (_southindianmovielist is EqualUnmodifiableListView)
      return _southindianmovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southindianmovielist);
  }

  final List<HotAndNewData> _top10tvlist;
  @override
  List<HotAndNewData> get top10tvlist {
    if (_top10tvlist is EqualUnmodifiableListView) return _top10tvlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top10tvlist);
  }

  @override
  final bool hasloading;
  @override
  final bool haserror;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, pastYearmovielist: $pastYearmovielist, trendingmovielist: $trendingmovielist, tensedramasmovielist: $tensedramasmovielist, southindianmovielist: $southindianmovielist, top10tvlist: $top10tvlist, hasloading: $hasloading, haserror: $haserror)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            const DeepCollectionEquality()
                .equals(other._pastYearmovielist, _pastYearmovielist) &&
            const DeepCollectionEquality()
                .equals(other._trendingmovielist, _trendingmovielist) &&
            const DeepCollectionEquality()
                .equals(other._tensedramasmovielist, _tensedramasmovielist) &&
            const DeepCollectionEquality()
                .equals(other._southindianmovielist, _southindianmovielist) &&
            const DeepCollectionEquality()
                .equals(other._top10tvlist, _top10tvlist) &&
            (identical(other.hasloading, hasloading) ||
                other.hasloading == hasloading) &&
            (identical(other.haserror, haserror) ||
                other.haserror == haserror));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      const DeepCollectionEquality().hash(_pastYearmovielist),
      const DeepCollectionEquality().hash(_trendingmovielist),
      const DeepCollectionEquality().hash(_tensedramasmovielist),
      const DeepCollectionEquality().hash(_southindianmovielist),
      const DeepCollectionEquality().hash(_top10tvlist),
      hasloading,
      haserror);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<HotAndNewData> pastYearmovielist,
      required final List<HotAndNewData> trendingmovielist,
      required final List<HotAndNewData> tensedramasmovielist,
      required final List<HotAndNewData> southindianmovielist,
      required final List<HotAndNewData> top10tvlist,
      required final bool hasloading,
      required final bool haserror}) = _$_Initial;

  @override
  String get stateId;
  @override
  List<HotAndNewData> get pastYearmovielist;
  @override
  List<HotAndNewData> get trendingmovielist;
  @override
  List<HotAndNewData> get tensedramasmovielist;
  @override
  List<HotAndNewData> get southindianmovielist;
  @override
  List<HotAndNewData> get top10tvlist;
  @override
  bool get hasloading;
  @override
  bool get haserror;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
