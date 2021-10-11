import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marut_theater/data/network/dtos.dart';
import 'package:marut_theater/data/network/response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

const _baseUrl = 'https://api.themoviedb.org/3';

final _dioProvider = Provider((ref) {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));
  dio.interceptors.add(_buildAccessTokenRequestInterceptor());
  return dio;
});

InterceptorsWrapper _buildAccessTokenRequestInterceptor() =>
    InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers['Authorization'] =
          'Bearer ${const String.fromEnvironment('TMDB_TOKEN')}';
      handler.next(options);
    });

final restClientProvider =
    Provider((ref) => RestClient(ref.read(_dioProvider)));

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/trending/all/day")
  Future<PageResponse<TrendingDto>> getTodayTrending(
    @CancelRequest() CancelToken cancelToken,
  );
}
