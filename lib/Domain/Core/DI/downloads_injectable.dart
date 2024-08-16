import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/DI/downloads_injectable.config.dart';

final getit = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
  $initGetIt(getit, environment: Environment.prod);
}
