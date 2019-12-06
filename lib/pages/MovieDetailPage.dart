import 'package:flutter/material.dart';
import 'package:tmdb/entity/entities.dart';
import 'package:tmdb/repo/repos.dart';
import 'package:tmdb/widgets/widgets.dart';

/**
 * TODO
 * - Person
 * - Posters
 * - Reviews
 */
class MovieDetailPage extends StatefulWidget {
  MovieDetailPage(this.movieId, {Key key}) : super(key: key);

  final int movieId;

  @override
  State<StatefulWidget> createState() {
    return MovieDetailPageState();
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  Movie _movie;
  List<Cast> _castList;

  @override
  void initState() {
    super.initState();
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie detail"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDetail,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
      body: Container(
        color: Colors.white,
        child: _movie == null
            ? EmptyView()
            : Material(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MovieDetailHeader(_movie),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Paragraph("Overview", _movie.overview),
                      ),
                      PortraitGallery("Cast:", _castList),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void _getDetail() async {
    _movie = await MovieRepo.instance().movieDetail(widget.movieId);
    _castList = await MovieRepo.instance().movieCast(widget.movieId);
    print("getDetail movie: ${_movie.title} & casts: ${_castList.length}");
    setState(() {});
  }
}
