import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Search/Models/seach_response/seach_response.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Search/search_service.dart';

import '../../Domain/Core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImplements implements SearchService {
  @override
  Future<Either<MainFailure, SeachResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': movieQuery,
      });
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SeachResponse.fromJson(response.data);
        // print(downloadslist);
        return right(result);
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return left(const MainFailure.clientFailure());
    }
  }
}
