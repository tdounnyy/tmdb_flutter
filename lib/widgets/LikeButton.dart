import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  LikeButton(this.like, this.onTap);

  final bool like;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.0),
        child: Icon(
          like ? Icons.favorite : Icons.favorite_border,
          color: like ? Colors.redAccent : Colors.grey,
        ),
      ),
    );
  }
}
