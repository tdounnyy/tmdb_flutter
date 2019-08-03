import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';

class Portrait extends StatelessWidget {
  Portrait(this.people);

  final People people;

  @override
  Widget build(BuildContext context) {
    var profile_url = ImageRepo.instance().buildImageUrl(people.profile_path);
    return Container(
      width: 100,
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: profile_url,
              ),
            ),
            Expanded(
              child: Text(
                people.name,
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
            onTap: _tapOnPortrait,
          ),
        )
      ]),
    );
  }

  void _tapOnPortrait() {
    print("tapOnPortrait() ${people.name}");
  }
}
