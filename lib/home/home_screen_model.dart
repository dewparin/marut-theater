import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marut_theater/data/repository/tmdb_repository.dart';
import 'package:marut_theater/entity/entities.dart';

final todayTrendingMediaFutureProvider =
    FutureProvider.autoDispose((ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final repository = ref.watch(repositoryProvider);
  final trending = await repository.fetchTodayTrendingMedia(cancelToken);
  trending.retainWhere((t) => t is TmdbMedia);
  ref.maintainState = true;
  return trending;
});
