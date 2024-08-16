import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/api_end_points.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/Models/downloads.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/i_downloads_repo.dart';

@LazySingleton(as: IDownloadsReposit)
class DownloadsRepository implements IDownloadsReposit {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(
          response.data.toString(),
        );
        final downloadslist = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        // ignore: avoid_print
        print("downloadslist");
        return Right(downloadslist);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
