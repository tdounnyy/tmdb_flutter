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
    return GestureDetector(
      onTap: _tapOnPortrait,
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: profile_url,
              ),
            ),
            Text(
              people.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _tapOnPortrait() {
    print("tapOnPortrait() ${people.name}");
  }
}
