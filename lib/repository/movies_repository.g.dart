// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesRepositoryHash() => r'cc6c1b2ef0c0f3ab187949a2460f7be9bc9947e3';

/// See also [moviesRepository].
@ProviderFor(moviesRepository)
final moviesRepositoryProvider = AutoDisposeProvider<MoviesRepository>.internal(
  moviesRepository,
  name: r'moviesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$moviesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MoviesRepositoryRef = AutoDisposeProviderRef<MoviesRepository>;
String _$movieRepoHash() => r'174242c9baacec1b6008c5906804c4c2283dc674';

/// See also [MovieRepo].
@ProviderFor(MovieRepo)
final movieRepoProvider =
    AutoDisposeNotifierProvider<MovieRepo, Object?>.internal(
  MovieRepo.new,
  name: r'movieRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$movieRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MovieRepo = AutoDisposeNotifier<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
