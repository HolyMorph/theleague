import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/ic_empty.png', scale: 2),
        const SizedBox(height: 16),
        Text(
          'Тоглогчийн жагсаалт хоосон байна',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.3),
            fontFamily: 'GIP',
          ),
        ),
      ],
    );
  }
}
