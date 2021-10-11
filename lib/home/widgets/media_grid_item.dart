import 'package:flutter/material.dart';
import 'package:marut_theater/constant.dart';
import 'package:marut_theater/entity/entities.dart';

class MediaGridItem extends StatelessWidget {
  final TmdbMedia media;

  const MediaGridItem({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(defaultPadding),
        elevation: defaultCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 0.67,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadius),
                      topRight: Radius.circular(defaultBorderRadius),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(media.posterPath),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: smallPadding,
                ),
                child: Text(media.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ),
      );
}
