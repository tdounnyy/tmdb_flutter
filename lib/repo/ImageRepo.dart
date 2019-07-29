import 'package:tmdb/util/C.dart';

class ImageRepo {
  static const REMOTE_IMAGE_REPO = "https://image.tmdb.org/t/p";
  static const POSTER_SIZE = "w780";

  Future<String> image(String baseUrl, String fileSize, String filePath) async {
    // TODO
    return null;
  }

  String buildImageUrl(String filePath) {
    return "$REMOTE_IMAGE_REPO/$POSTER_SIZE$filePath?api_key=${C.API_KEY}";
  }
}
