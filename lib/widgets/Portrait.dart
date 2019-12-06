import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/widgets/widgets.dart';

class Portrait extends StatelessWidget {
  Portrait(this.person);

  final Person person;

  @override
  Widget build(BuildContext context) {
    var profileUrl = ImageRepo.instance().buildImageUrl(person.profilePath);
    return Container(
      width: 100,
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: profileUrl,
                  ),
                ),
                LikeButton(true),
              ],
            ),
            Expanded(
              child: Text(
                person.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _tapOnPortrait(context),
          ),
        )
      ]),
    );
  }

  void _tapOnPortrait(BuildContext context) {
    print("tapOnPortrait() ${person.name}");
    Navigator.of(context).pushNamed('/personDetail', arguments: person.id);
  }
}
