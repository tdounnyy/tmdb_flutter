import 'package:flutter/widgets.dart';

class FavoritePersonModel extends ChangeNotifier {
  List<num> favorites = new List<num>();

  bool isFavorite(num personId) {
    return favorites.contains(personId);
  }

  void toggleFavoritePerson(num personId) {
    if (isFavorite(personId)) {
      favorites.remove(personId);
    } else {
      favorites.add(personId);
    }
    notifyListeners();
  }
}
