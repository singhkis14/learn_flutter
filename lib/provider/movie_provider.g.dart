// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieHash() => r'b1e5caa4c647ff6a0c7e260496fd3575af7fd910';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [movie].
@ProviderFor(movie)
const movieProvider = MovieFamily();

/// See also [movie].
class MovieFamily extends Family<AsyncValue<TMDBMovie>> {
  /// See also [movie].
  const MovieFamily();

  /// See also [movie].
  MovieProvider call(
    int movieId,
  ) {
    return MovieProvider(
      movieId,
    );
  }

  @override
  MovieProvider getProviderOverride(
    covariant MovieProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieProvider';
}

/// See also [movie].
class MovieProvider extends AutoDisposeFutureProvider<TMDBMovie> {
  /// See also [movie].
  MovieProvider(
    int movieId,
  ) : this._internal(
          (ref) => movie(
            ref as MovieRef,
            movieId,
          ),
          from: movieProvider,
          name: r'movieProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieHash,
          dependencies: MovieFamily._dependencies,
          allTransitiveDependencies: MovieFamily._allTransitiveDependencies,
          movieId: movieId,
        );

  MovieProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<TMDBMovie> Function(MovieRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieProvider._internal(
        (ref) => create(ref as MovieRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TMDBMovie> createElement() {
    return _MovieProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieRef on AutoDisposeFutureProviderRef<TMDBMovie> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieProviderElement extends AutoDisposeFutureProviderElement<TMDBMovie>
    with MovieRef {
  _MovieProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieProvider).movieId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
