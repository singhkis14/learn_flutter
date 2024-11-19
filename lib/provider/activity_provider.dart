import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter/models/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'activity_provider.g.dart';

@riverpod
Future<Activity> activity(Ref ref) async {
  final response = await http.get(Uri.http('boredapi.com', '/api/activity'));
  final json = jsonDecode(response.body);
  return Activity.fromJson(json);
}
