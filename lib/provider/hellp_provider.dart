import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hellp_provider.g.dart';

class Dio {}

final dioProviderS = Provider<Dio>((ref) => Dio());

@riverpod
Dio dio(Ref ref) {
  return Dio();
}
