import 'package:film_oasis/product/constants/enum/json_path.dart';

extension JsonPathExtension on JsonPath {
  String _path() {
    switch (this) {
      case JsonPath.movieLottie:
        return 'movieLottie';
    }
  }

  String get path => 'assets/json/${_path()}.json';
}