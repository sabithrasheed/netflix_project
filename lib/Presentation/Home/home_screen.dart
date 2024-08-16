import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Application/home/home_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';

import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/background_widget.dart';

import 'package:sabith_rasheed_netflix_demo/Presentation/Home/Widgets/number_widget.dart';

import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/home_maincard.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomescreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    // ignore: avoid_print
                    print(direction);
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    return true;
                  },
                  child: Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          BlocProvider.of<HomeBloc>(context).add(
                            const GetHomescreenData(),
                          );
                        },
                        child: BlocBuilder<HomeBloc, HomeState>(
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
                                  "Error While Getting Data",
                                  style: TextStyle(
                                    color: mwhite,
                                  ),
                                ),
                              );
                            }
                            //PastYear List*******************************
                            final releasedpastyear =
                                state.pastYearmovielist.map((m) {
                              return "$imageappendurl${m.posterPath}";
                            }).toList();
                            //TrendingNow List**********************************
                            final trendingnow =
                                state.trendingmovielist.map((m) {
                              return "$imageappendurl${m.posterPath}";
                            }).toList();
                            trendingnow.shuffle();

                            //TenseDRamas List**************************************
                            final tensedramas =
                                state.tensedramasmovielist.map((m) {
                              return "$imageappendurl${m.posterPath}";
                            }).toList();
                            tensedramas.shuffle();

                            //SouthIndian List************************************************
                            final southindian =
                                state.southindianmovielist.map((m) {
                              return "$imageappendurl${m.posterPath}";
                            }).toList();
                            southindian.shuffle();
                            //Tv Shows List********************************************
                            final tvmovies = state.top10tvlist.map((t) {
                              return "$imageappendurl${t.posterPath}";
                            }).toList();
                            tvmovies.shuffle();
                            //Movielist Of ListView**********************************************
                            return ListView(
                              children: [
                                const BackGroundWidgetCard(),
                                mheight,
                                HomeMainTitleCard(
                                  title: "Released In The Past Year",
                                  posterpath: releasedpastyear,
                                ),
                                mheight,
                                HomeMainTitleCard(
                                  title: "Trending Now",
                                  posterpath: trendingnow,
                                ),
                                mheight,
                                NumberWidgetCard(
                                  posterpath: tvmovies,
                                ),
                                mheight,
                                HomeMainTitleCard(
                                  title: "Tense Dramas",
                                  posterpath: tensedramas,
                                ),
                                mheight,
                                HomeMainTitleCard(
                                  title: "South Indian Cinema",
                                  posterpath: southindian,
                                ),
                                mheight,
                              ],
                            );
                          },
                        ),
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 1000,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq4N3xaDYwv3Hz2MKb9q1WlJydOtbbURDcO63iw1P6qwt5DSCdr_-ekRPDf8xOIarH2n8&usqp=CAU",
                                          width: 46,
                                          height: 55,
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.cast,
                                            size: 30,
                                            color: mwhite,
                                          ),
                                        ),
                                        mwidth,
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            color: mblue,
                                          ),
                                        ),
                                        mheight,
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "TV Shows",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Movies",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Categories",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : mheight
                    ],
                  ),
                ),
              );
            }));
  }
}
