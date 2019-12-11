import 'package:flutter/widgets.dart';
import 'package:tmdb/persist/FavoritePersist.dart';

class FavoriteMovieModel extends ChangeNotifier {
  var persist = FavoritePersist.instance();

  bool isFavorite(num movieId) {
    return persist.isFavoriteMovie(movieId);
  }

  void toggleFavoriteMovie(num movieId) {
    if (isFavorite(movieId)) {
      persist.removeFavoriteMovie(movieId);
    } else {
      persist.addFavoriteMovie(movieId);
    }
    notifyListeners();
  }
}
