import 'package:flutter/material.dart';

class NormalBottomNavigationWidget extends StatefulWidget {
  final int currentPage;
  final Function(int page) onTap;
  const NormalBottomNavigationWidget({required this.currentPage, required this.onTap, Key? key}) : super(key: key);

  @override
  _NormalBottomNavigationWidgetState createState() => _NormalBottomNavigationWidgetState();
}

class _NormalBottomNavigationWidgetState extends State<NormalBottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTap,
      currentIndex: widget.currentPage,
      items: [
        _bottomItem(
          icon: const Icon(Icons.message),
          message: 'Message',
        ),
        _bottomItem(
          icon: const Icon(Icons.phone),
          message: 'Phone',
        ),
        _bottomItem(
          icon: const Icon(Icons.house),
          message: 'Home',
        ),
      ],
    );
  }

  /// [BottomNavigationBar]-ийн зөвхөн нэг item харуулах функц.
  BottomNavigationBarItem _bottomItem({required Widget icon, required String message}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: message,
    );
  }
}
