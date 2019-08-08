import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/widgets/Portrait.dart';
import 'package:tmdb/widgets/widgets.dart';

class PortraitGallery extends StatelessWidget {
  PortraitGallery(this.galleryTitle, this.peopleList);

  final String galleryTitle;
  final List<People> peopleList;
  static const int MAX_PORTRAIT = 9;
  static const double PORTRAIT_HEIGHT = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionHeader(
          galleryTitle,
        ),
        SizedBox(
          height: PORTRAIT_HEIGHT,
          child: peopleList == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Portrait(peopleList[index]),
                  itemCount: math.min(peopleList.length, MAX_PORTRAIT),
                ),
        ),
      ],
    );
  }
}
