import 'package:flutter/material.dart';

import '../collection_title.dart';

class MySliderCollection extends StatefulWidget {
  const MySliderCollection({Key? key}) : super(key: key);

  @override
  _MyDemoSliderState createState() => _MyDemoSliderState();
}

class _MyDemoSliderState extends State<MySliderCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CollectionTitle(name: 'BottomNavigation'),
      ],
    );
  }
}
