import 'package:flutter/material.dart';
import 'package:tmdb/widgets/widgets.dart';

class Paragraph extends StatefulWidget {
  Paragraph(this.title, this.content);

  final String title;
  final String content;

  @override
  State<StatefulWidget> createState() {
    return ParagraphState(title, content);
  }
}

class ParagraphState extends State<Paragraph> {
  ParagraphState(this.title, this.content);

  static const EMPTY_OVERVIEW = "Nothing...";

  String title;
  String content;
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(title),
          // TODO: [RichText] with expand hint at the end of ellipsis
          Text(
            content ?? EMPTY_OVERVIEW,
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
