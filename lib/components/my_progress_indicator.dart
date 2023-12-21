import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class MyProgressIndicator extends StatefulWidget {
  @override
  _CustomLinearProgressIndicatorState createState() => _CustomLinearProgressIndicatorState();
}

class _CustomLinearProgressIndicatorState extends State<MyProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white,
      minHeight: 10,
      value: null,
      valueColor: AlwaysStoppedAnimation<Color>(MyColors.primaryColor),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
