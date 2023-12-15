import 'package:flutter/material.dart';

class SelectItem extends StatelessWidget {
  final VoidCallback onTap;
  final String positionName;
  const SelectItem({required this.positionName, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset('assets/icons/ic_selector.png', width: 40),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Color(0xFF393C50).withOpacity(0.8),
            ),
            child: Text(
              positionName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
