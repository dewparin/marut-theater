import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marut_theater/marut_theater_app.dart';

void main() {
  runApp(const ProviderScope(
    child: MarutTheaterApp(),
  ));
}
