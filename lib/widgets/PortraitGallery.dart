import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/widgets/Portrait.dart';

class PortraitGallery extends StatelessWidget {
  PortraitGallery(this.peopleList);

  final List<People> peopleList;
  static const int MAX_PORTRAIT = 9;
  static const double PORTRAIT_HEIGHT = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PORTRAIT_HEIGHT,
      child: peopleList == null
          ? Text("d=====(￣▽￣*)b")
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Portrait(peopleList[index]),
              itemCount: math.min(peopleList.length, MAX_PORTRAIT),
            ),
    );
  }
}
