import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizedBottomNavigationWidget extends StatefulWidget {
  final int currentPage;
  final Function(int page) onTap;
  const CustomizedBottomNavigationWidget({Key? key, required this.currentPage, required this.onTap}) : super(key: key);

  @override
  _CustomizedBottomNavigationWidgetState createState() => _CustomizedBottomNavigationWidgetState();
}

class _CustomizedBottomNavigationWidgetState extends State<CustomizedBottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.green.withOpacity(0.5),
      selectedIconTheme: Get.theme.bottomNavigationBarTheme.selectedIconTheme?.copyWith(
        color: Colors.orange,
      ),
      selectedItemColor: Colors.orange,
      unselectedIconTheme: Get.theme.bottomNavigationBarTheme.unselectedIconTheme?.copyWith(
        color: Colors.orange.withOpacity(0.5),
      ),
      unselectedItemColor: Colors.orange.withOpacity(0.5),
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

  ///[BottomNavigationBar]-ийн зөвхөн нэг item харуулах функц
  BottomNavigationBarItem _bottomItem({required Widget icon, required String message}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: message,
    );
  }
}
