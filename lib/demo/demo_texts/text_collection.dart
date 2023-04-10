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
          'displayLarge',
          style: _textTheme.displayLarge,
        ),
        const CollectionDivider(),
        Text(
          'displayMedium',
          style: _textTheme.displayMedium,
        ),
        const CollectionDivider(),
        Text(
          'displaySmall',
          style: _textTheme.displaySmall,
        ),
        const CollectionDivider(),
        Text(
          'headlineMedium',
          style: _textTheme.headlineMedium,
        ),
        const CollectionDivider(),
        Text(
          'headlineSmall',
          style: _textTheme.headlineSmall,
        ),
        const CollectionDivider(),
        Text(
          'titleLarge',
          style: _textTheme.titleLarge,
        ),
        const CollectionDivider(),
        Text(
          'titleMedium',
          style: _textTheme.titleMedium,
        ),
        const CollectionDivider(),
        Text(
          'titleSmall',
          style: _textTheme.titleSmall,
        ),
        const CollectionDivider(),
        Text(
          'bodyLarge',
          style: _textTheme.bodyLarge,
        ),
        const CollectionDivider(),
        Text(
          'bodyMedium',
          style: _textTheme.bodyMedium,
        ),
        const CollectionDivider(),
        Text(
          'bodySmall',
          style: _textTheme.bodySmall,
        ),
        const CollectionDivider(),
        Text(
          'labelLarge',
          style: _textTheme.labelLarge,
        ),
        const CollectionDivider(),
        Text(
          'labelSmall',
          style: _textTheme.labelSmall,
        ),
      ],
    );
  }
}
