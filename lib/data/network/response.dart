import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageResponse<T> {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'results')
  final List<T> results;

  PageResponse(this.page, this.totalPages, this.totalResults, this.results);

  factory PageResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) jsonToItem) =>
      _$PageResponseFromJson(json, jsonToItem);
}
