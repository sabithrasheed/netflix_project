import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Application/downloads/downloads_bloc.dart';
import 'package:sabith_rasheed_netflix_demo/Core/Colors/colors.dart';
import 'package:sabith_rasheed_netflix_demo/Core/const_values.dart';
import 'package:sabith_rasheed_netflix_demo/Presentation/Widgets/appbar_wiget.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final _widgetlist = [
    const _SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: AppbarWidgetPage(title: 'Downloads'),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(
          10,
        ),
        itemBuilder: ((context, index) {
          return _widgetlist[index];
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 25,
          );
        }),
        itemCount: _widgetlist.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
    this.index1 = 0,
    this.index2 = 1,
    this.index3 = 2,
  });
  final int index1;
  final int index2;
  final int index3;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final Size size = MediaQuery.of(context).size;

    return Column(children: [
      const Text(
        'Introducing Downloads for you',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: mwhite,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      mheight,
      const Text(
        "We will download a perzonalized selection of\n movies and shows for you, so there's\n always something to watch on your\n device.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: mgrey),
      ),
      mheight,
      BlocBuilder<DownloadsBloc, DownloadsState>(
        builder: (context, state) {
          return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        backgroundColor: mgrey.withOpacity(
                          0.9,
                        ),
                        radius: size.width * 0.4,
                      ),
                      DownloadsImageWidget(
                        downloadsurl:
                            '$imageappendurl${state.downloads[index1].posterPath}',
                        margin: const EdgeInsets.only(left: 170, top: 6),
                        angle: 24,
                        size: Size(
                          size.width * 0.35,
                          size.width * 0.55,
                        ),
                      ),
                      DownloadsImageWidget(
                        downloadsurl:
                            '$imageappendurl${state.downloads[index2].posterPath}',
                        margin: const EdgeInsets.only(
                          right: 170,
                        ),
                        angle: -21,
                        size: Size(
                          size.width * 0.35,
                          size.width * 0.55,
                        ),
                      ),
                      DownloadsImageWidget(
                        downloadsurl:
                            '$imageappendurl${state.downloads[index3].posterPath}',
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        radius: 10,
                        size: Size(
                          size.width * 0.4,
                          size.width * 0.6,
                        ),
                      ),
                    ]));
        },
      )
    ]);
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: (MaterialButton(
            color: setupcolor,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              10,
            )),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: mwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        ),
        mheight,
        (MaterialButton(
          color: mwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10,
          )),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: mblack,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        mwidth,
        Icon(
          Icons.settings,
          color: mwhite,
        ),
        mwidth,
        Text(
          'Smart Downloads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    this.angle = 1,
    this.radius = 10,
    required this.margin,
    required this.size,
    required this.downloadsurl,
  }) : super(key: key);

  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;
  final String downloadsurl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          child: Container(
            //  margin: margin,
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      downloadsurl,
                    ))),
          ),
        ),
      ),
    );
  }
}
