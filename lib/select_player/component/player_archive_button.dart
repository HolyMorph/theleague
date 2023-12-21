import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/logic/home_controller.dart';
import '../../style/my_colors.dart';

class PlayerArchiveButton extends GetView<HomeController> {
  final Widget child;
  final VoidCallback onTap;
  const PlayerArchiveButton({required this.child, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: MyColors.buttonBackColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          ),
        ),
        ObxValue(
          (_) => controller.state.totalQty <= 0
              ? const SizedBox()
              : Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: MyColors.redColor,
                    ),
                    child: Text(
                      '${controller.state.totalQty.value}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
          controller.state.totalQty,
        ),
      ],
    );
  }
}
