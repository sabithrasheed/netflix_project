import 'package:dartz/dartz.dart';

import '../Domain/Core/Failures/main_failure.dart';
import 'Models/new_and_hot_response.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewMovieData();
  Future<Either<MainFailure, NewAndHotResponse>> getHotAndNewTvData();
}
