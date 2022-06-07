import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../collection_divider.dart';
import '../collection_title.dart';

class TextCollection extends StatefulWidget {
  const TextCollection({Key? key}) : super(key: key);

  @override
  State<TextCollection> createState() => _TextCollectionState();
}

class _TextCollectionState extends State<TextCollection> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Get.theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Текст загварууд'),
        const CollectionDivider(),
        Text(
          'Headline 1',
          style: _textTheme.headline1,
        ),
        const CollectionDivider(),
        Text(
          'Headline 2',
          style: _textTheme.headline2,
        ),
        const CollectionDivider(),
        Text(
          'Headline 3',
          style: _textTheme.headline3,
        ),
        const CollectionDivider(),
        Text(
          'Headline 4',
          style: _textTheme.headline4,
        ),
        const CollectionDivider(),
        Text(
          'Headline 5',
          style: _textTheme.headline5,
        ),
        const CollectionDivider(),
        Text(
          'Headline 6',
          style: _textTheme.headline6,
        ),
        const CollectionDivider(),
        Text(
          'Subtitle 1',
          style: _textTheme.subtitle1,
        ),
        const CollectionDivider(),
        Text(
          'Subtitle 2',
          style: _textTheme.subtitle2,
        ),
        const CollectionDivider(),
        Text(
          'BodyText 1',
          style: _textTheme.bodyText1,
        ),
        const CollectionDivider(),
        Text(
          'BodyText 2',
          style: _textTheme.bodyText2,
        ),
        const CollectionDivider(),
        Text(
          'Caption',
          style: _textTheme.caption,
        ),
        const CollectionDivider(),
        Text(
          'Button',
          style: _textTheme.button,
        ),
        const CollectionDivider(),
        Text(
          'Overline',
          style: _textTheme.overline,
        ),
      ],
    );
  }
}
