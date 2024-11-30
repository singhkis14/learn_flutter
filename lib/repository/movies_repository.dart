import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/provider/hellp_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_repository.g.dart';

class TMDBMovie {}

class MoviesRepository {
  final Dio client;
  final String apiKey;

  MoviesRepository({required this.client, required this.apiKey});

  Future<List<TMDBMovie>> searchMovies({required int page, String query = ''}) {
    return Future.value([]);
  }

  Future<List<TMDBMovie>> nowPlayingMovies({required int page}) {
    return Future.value([]);
  }

  Future<TMDBMovie> movie({required int movieId}) {
    return Future.value(TMDBMovie());
  }
}

@riverpod
MoviesRepository moviesRepository(Ref ref) => MoviesRepository(client: ref.watch(dioProvider), apiKey: '');

@riverpod
class MovieRepo extends _$MovieRepo {
  @override
  build() {
    return MoviesRepository(client: ref.watch(dioProvider), apiKey: '');
  }
}
