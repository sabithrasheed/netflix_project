import 'package:flutter/material.dart';

class SearchTexttitle extends StatelessWidget {
  final String title;
  const SearchTexttitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
