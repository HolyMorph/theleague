import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamItem extends StatelessWidget {
  final String iconPath;
  final Function(String) onTap;
  final String teamCode;
  final Color teamColor;
  const TeamItem({required this.onTap, required this.iconPath, required this.teamColor, required this.teamCode, super.key});

  @override
  Widget build(BuildContext context) {
    final RxString _teamCode = RxString('');

    return Material(
      color: Color(0xFF3B3D4F).withOpacity(0.3),
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          _teamCode.value = teamCode;
          onTap(teamCode);
        },
        child: ObxValue(
          (_) => Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: _teamCode.value == teamCode ? teamColor : Color(0xFF3B3D4F)),
              color: Colors.transparent,
            ),
            child: Image.asset('assets/icons/ic_ihc.png', fit: BoxFit.contain),
          ),
          _teamCode,
        ),
      ),
    );
  }
}
