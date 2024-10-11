import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';
import 'athlete_info.dart';
import 'league_athelete_info.dart';

class PersonalInfo extends StatelessWidget {
  final dynamic userData;
  const PersonalInfo({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          ((userData['isProAthelete'] ?? false) && userData['type'] == 'athelete')
              ? LeagueAthleteInfo(userData: userData)
              : AthleteInfo(userData: userData),
          if (userData['type'] == 'athelete')
            Column(
              children: [
                const Divider(height: 1, thickness: 1, color: MyColors.grey100),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          userData['gender'] == 'male' ? 'Эр' : 'Эм',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.greyBlue800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Хүйс',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${userData['height']}см',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.greyBlue800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Өндөр',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${userData['weight']}кг',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.greyBlue800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Жин',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
        ],
      ),
    );
  }
}
