import 'package:bform/bform.dart';
import 'package:easy_localization/easy_localization.dart';

class Genre implements BformObj {
  final int genreId;
  final String genreTitle;
  final String genreImage;

  Genre({
    required this.genreId,
    required this.genreTitle,
    required this.genreImage,
  });

  @override
  int get id => genreId;

  @override
  String get imagePath => genreImage;

  @override
  bool isSame(BformObj value) => id == value.id;

  @override
  String get subtitle {
    return "$genreId: $genreTitle";
  }

  @override
  String get title => genreTitle;
}

final listGenres = [
  Genre(
    genreId: 0,
    genreTitle: tr('itemMale'),
    genreImage: 'assets/images/icons/genre_male.png',
  ),
  Genre(
    genreId: 1,
    genreTitle: tr('itemFemale'),
    genreImage: 'assets/images/icons/genre_female.png',
  ),
];
