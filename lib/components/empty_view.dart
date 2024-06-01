import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/my_colors.dart';
import '../utils/fa_icon.dart';

class EmptyView extends StatelessWidget {
  final String text;
  const EmptyView({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FaIcon.inbox,
                  style: FaIcon.regular().copyWith(color: MyColors.emptyGrey, fontSize: 50),
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.emptyGrey,
                  ),
                ).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
