import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/repository/movies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_provider.g.dart';

final movieOldProvider = FutureProvider.autoDispose.family<TMDBMovie, int>((ref, movieId) {
  return ref.watch(moviesRepositoryProvider).movie(movieId: movieId);
});

@Riverpod(keepAlive: false)
Future<TMDBMovie> movie(Ref ref, int movieId) {
  return ref.watch(moviesRepositoryProvider).movie(movieId: movieId);
}
