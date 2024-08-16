import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Application/Search/search_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';

import 'title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTexttitle(title: 'Top Searches'),
        aheight15,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.iserror) {
                return const Center(
                  child: Text("Error while getting data"),
                );
              } else if (state.idlelist.isEmpty) {
                return const Center(
                  child: Text("List is empty"),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movie = state.idlelist[index];
                  return TopSearchesItem(
                      title: movie.title ?? 'No title provide',
                      serverurl: '$imageappendurl${movie.posterPath}');
                },
                separatorBuilder: (ctx, index) {
                  return aheight;
                },
                itemCount: state.idlelist.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchesItem extends StatelessWidget {
  final String title;
  final String serverurl;
  const TopSearchesItem({
    super.key,
    required this.title,
    required this.serverurl,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.4,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              serverurl,
            ),
          )),
        ),
        const SizedBox(
          width: 5,
        ),
        mwidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: mwhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: mwhite,
          radius: 24,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: mblack,
            child: Icon(
              CupertinoIcons.play_fill,
              color: mwhite,
            ),
          ),
        ),
      ],
    );
  }
}
