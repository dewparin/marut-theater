import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:marut_theater/data/network/network_constants.dart';
import 'package:marut_theater/entity/entities.dart';

part 'dtos.g.dart';

@JsonSerializable()
class TrendingDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'media_type')
  final String mediaType;

  @JsonKey(name: 'overview', defaultValue: '')
  final String overview;

  /// For the name field, Movie uses field name `title`
  /// while TV Show and Person use field name `name`.
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  /// For the image path field, TV Show and Movie use field name `poster_path`
  /// while Person uses`profile_path`.
  @JsonKey(name: 'poster_path', defaultValue: '')
  final String posterImagePath;
  @JsonKey(name: 'profile_path', defaultValue: '')
  final String profileImagePath;

  TrendingDto(
    this.id,
    this.mediaType,
    this.overview,
    this.title,
    this.name,
    this.posterImagePath,
    this.profileImagePath,
  );

  factory TrendingDto.fromJson(Map<String, dynamic> json) =>
      _$TrendingDtoFromJson(json);
}

// TODO : construct image url

extension EntityMapping on TrendingDto {
  TmdbEntity mapToEntity() {
    switch (mediaType) {
      case "movie":
        return _mapToMovie();
      case "tv":
        return _mapToTvShow();
      case "person":
        return _mapToPerson();
      default:
        return _mapToUnSupportedType();
    }
  }

  Movie _mapToMovie() => Movie(
        id: id,
        posterPath: posterImageBaseUrl + posterImagePath,
        title: title,
        overview: overview,
      );

  TvShow _mapToTvShow() => TvShow(
        id: id,
        posterPath: posterImageBaseUrl + posterImagePath,
        title: name,
        overview: overview,
      );

  Person _mapToPerson() => Person(
        id: id,
        name: name,
        profileImageUrl: profileImagePath,
      );

  UnsupportedTmdbEntity _mapToUnSupportedType() =>
      UnsupportedTmdbEntity(id: id);
}
