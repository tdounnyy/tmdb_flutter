import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/util/GenderHelper.dart';
import 'package:tmdb/widgets/widgets.dart';

class PersonDetailPage extends StatefulWidget {
  PersonDetailPage(this.person, {Key key}) : super(key: key);

  final Person person;

  @override
  State<StatefulWidget> createState() {
    return PersonDetailPageState(person);
  }
}

class PersonDetailPageState extends State<PersonDetailPage> {
  PersonDetailPageState(this.person);

  Person person;

  @override
  void initState() {
    super.initState();
    _fetchPersonById(person.id);
  }

  @override
  Widget build(BuildContext context) {
    var profileUrl = ImageRepo.instance().buildImageUrl(person.profilePath);
    return Scaffold(
        appBar: AppBar(
          title: Text(person.name),
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                      Text(person.name ?? ""),
                      Text(GenderHelper.getGenderString(person.gender)),
                      Text(person.birthday ?? ""),
                      Text("🔥${person.popularity.toString()}"),
                      RaisedButton(
                        onPressed: () => {},
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text("Follow"),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Paragraph("Intro", person.biography),
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
    person = await PersonRepo.instance().personById(personId);
    setState(() {});
  }
}
