import 'package:json_annotation/json_annotation.dart';

import '../../../../Core/const_values.dart';

part 'seach_response.g.dart';

@JsonSerializable()
class SeachResponse {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SeachResponse({
    this.results = const [],
  });

  factory SeachResponse.fromJson(Map<String, dynamic> json) {
    return _$SeachResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeachResponseToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterimageurl => '$imageappendurl$posterPath';
  SearchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
