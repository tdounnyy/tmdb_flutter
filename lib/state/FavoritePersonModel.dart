import 'package:flutter/widgets.dart';
import 'package:tmdb/persist/FavoritePersist.dart';

class FavoritePersonModel extends ChangeNotifier {
  var persist = FavoritePersist.instance();

  bool isFavorite(num personId) {
    return persist.isFavoritePerson(personId);
  }

  void toggleFavoritePerson(num personId) {
    if (isFavorite(personId)) {
      persist.removeFavoritePerson(personId);
    } else {
      persist.addFavoritePerson(personId);
    }
    notifyListeners();
  }
}
