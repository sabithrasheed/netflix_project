import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/New&Hot/Widgets/comingsoon.dart';

import '../../Application/hotandnew/hotandnew_bloc.dart';
import 'Widgets/newandhoteveryones.dart';

class NewAndHotScren extends StatelessWidget {
  const NewAndHotScren({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            80,
          ),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                size: 30,
                color: mwhite,
              ),
              mwidth,
              Container(
                width: 30,
                height: 20,
                color: mblue,
              ),
              mwidth30
            ],
            bottom: TabBar(
                unselectedLabelColor: mwhite,
                isScrollable: true,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                labelColor: mblack,
                indicator: BoxDecoration(
                  color: mwhite,
                  borderRadius: mradius30,
                ),
                tabs: const [
                  Tab(
                    text: " 🍿Coming Soon",
                  ),
                  Tab(
                    text: "👀Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key("comingsoon"),
          ),
          EveryOnesWatchingList(
            key: Key(
              "Everyones_Is_Watching",
            ),
          )
          //  _buildEveryonesWatching(),
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(const Loaddataincomingsoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const Loaddataincomingsoon());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.hasloading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.haserror) {
            return const Center(
              child: Text(
                "error while loading coming soon list",
              ),
            );
          } else if (state.comingsoonlist.isEmpty) {
            return const Center(
              child: Text(
                "comingsoon list is empty",
              ),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                itemCount: state.comingsoonlist.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = state.comingsoonlist[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  log(
                    movie.releaseDate.toString(),
                  );
                  String month = "";
                  String day = "";
                  try {
                    // ignore: unused_local_variable
                    final date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(date!);
                    log(
                      formatedDate.toString(),
                    );
                    month = formatedDate
                        .split("   ")
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    day = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = "";
                  }

                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: day,
                    posterpath: "$imageappendurl${movie.posterPath}",
                    moviename: movie.originalTitle ?? "NO title",
                    description: movie.overview ?? "No description",
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryOnesWatchingList extends StatelessWidget {
  const EveryOnesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotandnewBloc>(context).add(
        const Loaddataineveryoneswatching(),
      );
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const Loaddataineveryoneswatching());
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.hasloading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.haserror) {
            return const Center(
              child: Text(
                "error while loading coming soon list",
              ),
            );
          } else if (state.eveyoneswatchinglist.isEmpty) {
            return const Center(
              child: Text(
                "everyoneswatching list is empty",
              ),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: state.eveyoneswatchinglist.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = state.eveyoneswatchinglist[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  final tv = state.eveyoneswatchinglist[index];
                  return NewAndHotwatchingWidegt(
                    posterpath: "$imageappendurl${tv.posterPath}",
                    orginalname: tv.originalName ?? "NO Name Provide",
                    description: tv.overview ?? "No Description",
                  );
                });
          }
        },
      ),
    );
  }
}
