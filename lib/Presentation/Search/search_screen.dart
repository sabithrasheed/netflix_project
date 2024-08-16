import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Application/Search/search_bloc.dart';

import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

import '../../Domain/Core/Debounce/debounce.dart';
import 'Widgets/search_idle.dart';
import 'Widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(
        const Initialize(),
      );
    });
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [       
          CupertinoSearchTextField(
            backgroundColor: mgrey.withOpacity(.7),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: mgrey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: mgrey,
            ),
            style: const TextStyle(color: mwhite),
            onChanged: (value) {
              if (value.isEmpty) {
                return;
              }

              _debouncer.run(() {
                BlocProvider.of<SearchBloc>(context).add(
                  searchMovies(movieQuery: value),
                );
              });
            },
          ),
          aheight,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const SearchIdleWidget();
              } else {
                return const SearchResultWidget();
              }
            },
          )),
          // const Expanded(child: SearchResultWidget())
        ],
      )),
    );
  }
}
