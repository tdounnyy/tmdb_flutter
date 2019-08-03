import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
