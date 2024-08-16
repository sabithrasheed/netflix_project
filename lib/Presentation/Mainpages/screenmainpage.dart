import 'package:flutter/material.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Downloads/screendownloads.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Fast%20Laughs/fast_laughs.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/home_screen.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Mainpages/Widgets/bottom_navigation.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/New&Hot/new_and_hot.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Search/search_screen.dart';

class ScreenMainpage extends StatelessWidget {
  ScreenMainpage({super.key});
  final _pages = [
    const HomeScreen(),
    const NewAndHotScren(),
    const FastLaughScreen(),
    SearchScreen(),
    DownloadScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (ValueListenableBuilder(
        valueListenable: indexchangenotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      )),
      bottomNavigationBar: const BottomNavigationScreen(),
    );
  }
}
