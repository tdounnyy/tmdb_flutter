import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/util/GenderHelper.dart';
import 'package:tmdb/widgets/widgets.dart';

class PersonDetailPage extends StatefulWidget {
  PersonDetailPage(this.personId, {Key key}) : super(key: key);

  final int personId;

  @override
  State<StatefulWidget> createState() {
    return PersonDetailPageState();
  }
}

class PersonDetailPageState extends State<PersonDetailPage> {
  Person _person;

  @override
  void initState() {
    super.initState();
    _fetchPersonById(widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    var profileUrl =
        ImageRepo.instance().buildImageUrl(_person?.profilePath ?? "");
    return Scaffold(
        appBar: AppBar(
          title: Text(_person?.name ?? ""),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: _person == null
              ? EmptyView()
              : Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            width: 150,
                            imageUrl: profileUrl,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_person.name ?? ""),
                            Text(GenderHelper.getGenderString(_person.gender)),
                            Text(_person.birthday ?? ""),
                            Text("🔥${_person.popularity.toString()}"),
                            LikeButton(true, _tapOnLikeButton),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Paragraph("Intro", _person.biography),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SectionHeader("Movies"),
                            Text("TODO"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ));
  }

  void _fetchPersonById(int personId) async {
    _person = await PersonRepo.instance().personById(personId);
    setState(() {});
  }

  void _tapOnLikeButton() {
    print("LikeButton tap on ${_person.name}");
  }
}
