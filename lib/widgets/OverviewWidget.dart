import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';

class OverviewWidget extends StatefulWidget {
  OverviewWidget(this.movie);

  final Movie movie;

  @override
  State<StatefulWidget> createState() {
    return OverviewWidgetState(movie);
  }
}

class OverviewWidgetState extends State<OverviewWidget> {
  OverviewWidgetState(this.movie);

  static const EMPTY_OVERVIEW = "Lack of overview";

  Movie movie;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Overview:"),
          // TODO: [RichText] with expand hint at the end of ellipsis
          Text(
            movie.overview ?? EMPTY_OVERVIEW,
            maxLines: expanded ? 10 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  void _onTap() {
    setState(() {
      expanded = !expanded;
    });
  }
}
