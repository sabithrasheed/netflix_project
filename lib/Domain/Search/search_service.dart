import 'package:dartz/dartz.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Search/Models/seach_response/seach_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SeachResponse>> searchMovies({
    required String movieQuery,
  });
}
