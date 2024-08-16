import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Domain/Core/DI/downloads_injectable.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Mainpages/screenmainpage.dart';

import 'Application/Search/search_bloc.dart';
import 'Application/downloads/downloads_bloc.dart';
import 'Application/fastLaugh/fast_laugh_bloc.dart';
import 'Application/home/home_bloc.dart';
import 'Application/hotandnew/hotandnew_bloc.dart';

Future<void> main() async {
  await configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getit<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getit<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getit<FastLaughBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getit<HotandnewBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getit<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'NetFlix App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
            scaffoldBackgroundColor: mblack,
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: mwhite),
              bodyMedium: TextStyle(color: mwhite),
            )),
        home: ScreenMainpage(),
      ),
    );
  }
}
