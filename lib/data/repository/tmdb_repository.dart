import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marut_theater/data/network/dtos.dart';
import 'package:marut_theater/data/network/rest_client.dart';
import 'package:marut_theater/entity/entities.dart';

final repositoryProvider =
    Provider((ref) => TmdbRepository(ref.read(restClientProvider)));

class TmdbRepository {
  final RestClient _restClient;

  TmdbRepository(this._restClient);

  Future<List<TmdbEntity>> fetchTodayTrendingMedia(CancelToken cancelToken) async {
    final resp = await _restClient.getTodayTrending(cancelToken);
    return resp.results.map((dto) => dto.mapToEntity()).toList();
  }
}
