import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:sabith_rasheed_netflix_demo/HotandNew/Models/new_and_hot_response.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sabith_rasheed_netflix_demo/HotandNew/hot_and_new_service.dart';

import '../../Domain/Core/api_end_points.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplemenst implements HotAndNewService {
  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandnewmovie,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResponse.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotandnewtv,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResponse.fromJson(response.data);
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
