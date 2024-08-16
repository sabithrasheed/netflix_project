import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

import 'package:sabith_rasheed_netflix_demo/Presentation/Search/Widgets/title.dart';

import '../../../Application/Search/search_bloc.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SearchTexttitle(title: 'Movies & TV'),
      mheight,
      Expanded(child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.5,
              children: List.generate(20, (index) {
                final movie = state.searchResultList[index];
                return SearchResultItemCard(serverurl: movie.posterimageurl);
              }));
        },
      ))
    ]);
  }
}

class SearchResultItemCard extends StatelessWidget {
  final String serverurl;
  const SearchResultItemCard({
    super.key,
    required this.serverurl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(serverurl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadiusDirectional.circular(7)),
    );
  }
}
