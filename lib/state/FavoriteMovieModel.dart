import 'package:flutter/widgets.dart';

class FavoriteMovieModel extends ChangeNotifier {
  List<num> favorites = new List();

  bool isFavorite(num movieId) {
    return favorites.contains(movieId);
  }

  void toggleFavoriteMovie(num movieId) {
    if (isFavorite(movieId)) {
      favorites.remove(movieId);
    } else {
      favorites.add(movieId);
    }
    notifyListeners();
  }
}
