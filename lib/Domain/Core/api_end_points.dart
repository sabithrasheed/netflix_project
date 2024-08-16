import 'package:sabith_rasheed_netflix_demo/Core/strings.dart';
import 'package:sabith_rasheed_netflix_demo/Infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$mbaseurl/trending/all/day?api_key=$apikey";
  static const search = "$mbaseurl/search/movie?api_key=$apikey";
  static const hotandnewmovie = "$mbaseurl/discover/movie?api_key=$apikey";
  static const hotandnewtv = "$mbaseurl/discover/tv?api_key=$apikey";
}
