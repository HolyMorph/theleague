import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompetitionHeader extends StatelessWidget {
  const CompetitionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          child: Image.asset('assets/images/all_star.png'),
        ),
        Container(
          height: 200,
          width: Get.size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          top: 32,
          left: 8,
          child: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.white, size: 36),
            onPressed: () => Get.back(),
          ),
        ),
      ],
    );
  }
}
