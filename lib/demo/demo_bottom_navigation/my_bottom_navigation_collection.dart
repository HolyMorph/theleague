import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';
import 'package:mezorn_dummy/demo/demo_bottom_navigation/customized_bottom_navigation_widget.dart';
import 'package:mezorn_dummy/demo/demo_bottom_navigation/normal_bottom_navigation_widget.dart';

class MyBottomNavigationCollection extends StatefulWidget {
  const MyBottomNavigationCollection({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationCollectionState createState() => _MyBottomNavigationCollectionState();
}

class _MyBottomNavigationCollectionState extends State<MyBottomNavigationCollection> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'BottomNavigation'),

        const Text('Хэвийн үеийн харагдац'),
        const SizedBox(height: 8),

        ///Энгийн үеийн [BottomNavigation]
        NormalBottomNavigationWidget(
          currentPage: _currentPage,
          onTap: _onPageChanged,
        ),

        const SizedBox(height: 24),
        const Text('Загвар өөрчилсөн үеийн харагдац'),
        const SizedBox(height: 8),

        ///Загвар өөрчилсөн үеийн [BottomNavigation]
        CustomizedBottomNavigationWidget(
          currentPage: _currentPage,
          onTap: _onPageChanged,
        ),
      ],
    );
  }

  ///Хуудас солих үйлдэл
  _onPageChanged(int page) {
    _currentPage = page;
    setState(() {});
  }
}
