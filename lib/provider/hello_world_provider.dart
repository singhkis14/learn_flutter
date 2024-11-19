import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_world_provider.g.dart';

/// Both providers are same. One is using codegeneration and other is self code.
@riverpod
String helloWorld(Ref ref) {
  return "Hello World";
}

final helloWorld2Provider = Provider((ref) {
  return 'Hello World 2';
});
