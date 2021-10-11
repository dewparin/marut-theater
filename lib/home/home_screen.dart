import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marut_theater/entity/entities.dart';
import 'package:marut_theater/home/home_screen_model.dart';
import 'package:marut_theater/home/widgets/media_grid_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) => Scaffold(
        appBar: AppBar(
          title: const Text('Trending'),
        ),
        body: Builder(
          builder: (context) {
            return watch(todayTrendingMediaFutureProvider).when(loading: () {
              return const Center(child: CircularProgressIndicator());
            }, error: (e, __) {
              return Center(child: Text('Error: ${e.toString()}'));
            }, data: (data) {
              return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    return MediaGridItem(media: data[index] as TmdbMedia);
                  });
            });
          },
        ),
      );
}
