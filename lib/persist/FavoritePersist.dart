import 'package:shared_preferences/shared_preferences.dart';

class FavoritePersist {
  static const String KEY_FAVORITE_MOVIES = "favorite_movies";
  static const String KEY_FAVORITE_PEOPLE = "favorite_people";

  List<int> favoriteMovies = List();
  List<int> favoritePeople = List();

  FavoritePersist._private() {
    init();
  }

  static final FavoritePersist _instance = FavoritePersist._private();

  factory FavoritePersist.instance() => _instance;

  Future<void> init() async {
    print("FavoritePersist init");
    favoriteMovies = await readFavoritesFromDisk(KEY_FAVORITE_MOVIES);
    favoritePeople = await readFavoritesFromDisk(KEY_FAVORITE_PEOPLE);
  }

  Future<List<int>> readFavoritesFromDisk(String key) async {
    List<int> intValues = List();
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> strValues = pref.getStringList(key);
    strValues?.forEach((id) => intValues.add(int.parse(id)));
    return intValues;
  }

  Future<bool> writeFavoritesToDisk(String key, List<int> list) async {
    List<String> strValues = List();
    list.forEach((value) => strValues.add(value.toString()));
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setStringList(key, strValues);
  }

  void addFavoriteMovie(int id) {
    if (!isFavoriteMovie(id)) {
      favoriteMovies.add(id);
      writeFavoritesToDisk(KEY_FAVORITE_MOVIES, favoriteMovies);
    }
  }

  void removeFavoriteMovie(int id) {
    if (isFavoriteMovie(id)) {
      favoriteMovies.remove(id);
      writeFavoritesToDisk(KEY_FAVORITE_MOVIES, favoriteMovies);
    }
  }

  void addFavoritePerson(int id) {
    if (!isFavoritePerson(id)) {
      favoritePeople.add(id);
      writeFavoritesToDisk(KEY_FAVORITE_PEOPLE, favoritePeople);
    }
  }

  void removeFavoritePerson(int id) {
    if (isFavoritePerson(id)) {
      favoritePeople.remove(id);
      writeFavoritesToDisk(KEY_FAVORITE_PEOPLE, favoritePeople);
    }
  }

  bool isFavoriteMovie(int id) {
    return favoriteMovies.contains(id);
  }

  bool isFavoritePerson(int id) {
    return favoritePeople.contains(id);
  }
}
