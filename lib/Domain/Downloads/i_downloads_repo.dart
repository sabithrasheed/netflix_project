import 'package:dartz/dartz.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/Failures/main_failure.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Downloads/Models/downloads.dart';

abstract class IDownloadsReposit {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
