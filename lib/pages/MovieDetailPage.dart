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
  MovieDetailPage(this.movie, {Key key}) : super(key: key);

  final Movie movie;

  @override
  State<StatefulWidget> createState() {
    return MovieDetailPageState(movie);
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailPageState(this.movie);

  Movie movie;
  List<Cast> castList;

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
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MovieDetailHeader(movie),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Paragraph("Overview", movie.overview),
                ),
                PortraitGallery("Cast:", castList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getDetail() async {
    movie = await MovieRepo.instance().movieDetail(movie.id);
    castList = await MovieRepo.instance().movieCast(movie.id);
    print("getDetail movie: ${movie.title} & casts: ${castList.length}");
    setState(() {});
  }
}
