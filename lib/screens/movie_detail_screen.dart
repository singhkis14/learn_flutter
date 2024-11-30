import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/provider/movie_provider.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieProvider(movieId));
    return movieAsync.when(
      data: (movie) => const Text('Movie'),
      error: (error, stackTrace) => const Text('error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
