abstract class TmdbEntity {
  final int id;

  TmdbEntity({required this.id});
}

class UnsupportedTmdbEntity extends TmdbEntity {
  UnsupportedTmdbEntity({
    required int id,
  }) : super(id: id);
}

class Person extends TmdbEntity {
  final String name;
  final String profileImageUrl;

  Person({
    required int id,
    required this.name,
    required this.profileImageUrl,
  }) : super(id: id);
}

class TmdbMedia extends TmdbEntity {
  final String title;
  final String overview;
  final String posterPath;

  TmdbMedia({
    required int id,
    required this.title,
    required this.overview,
    required this.posterPath,
  }) : super(
          id: id,
        );
}

class Movie extends TmdbMedia {
  Movie({
    required int id,
    required String posterPath,
    required String title,
    required String overview,
  }) : super(
          id: id,
          posterPath: posterPath,
          title: title,
          overview: overview,
        );
}

class TvShow extends TmdbMedia {
  TvShow({
    required int id,
    required String posterPath,
    required String title,
    required String overview,
  }) : super(
          id: id,
          posterPath: posterPath,
          title: title,
          overview: overview,
        );
}
