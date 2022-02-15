import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/demo/collection_divider.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

class TextCollection extends StatelessWidget {
  const TextCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Текст загварууд'),
        const CollectionDivider(),
        Text(
          'Headline 1',
          style: Get.theme.textTheme.headline1,
        ),
        const CollectionDivider(),
        Text(
          'Headline 2',
          style: Get.theme.textTheme.headline2,
        ),
        const CollectionDivider(),
        Text(
          'Headline 3',
          style: Get.theme.textTheme.headline3,
        ),
        const CollectionDivider(),
        Text(
          'Headline 4',
          style: Get.theme.textTheme.headline4,
        ),
        const CollectionDivider(),
        Text(
          'Headline 5',
          style: Get.theme.textTheme.headline5,
        ),
        const CollectionDivider(),
        Text(
          'Headline 6',
          style: Get.theme.textTheme.headline6,
        ),
        const CollectionDivider(),
        Text(
          'Subtitle 1',
          style: Get.theme.textTheme.subtitle1,
        ),
        const CollectionDivider(),
        Text(
          'Subtitle 2',
          style: Get.theme.textTheme.subtitle2,
        ),
        const CollectionDivider(),
        Text(
          'BodyText 1',
          style: Get.theme.textTheme.bodyText1,
        ),
        const CollectionDivider(),
        Text(
          'BodyText 2',
          style: Get.theme.textTheme.bodyText2,
        ),
        const CollectionDivider(),
        Text(
          'Caption',
          style: Get.theme.textTheme.caption,
        ),
        const CollectionDivider(),
        Text(
          'Button',
          style: Get.theme.textTheme.button,
        ),
        const CollectionDivider(),
        Text(
          'Overline',
          style: Get.theme.textTheme.overline,
        ),
      ],
    );
  }
}
