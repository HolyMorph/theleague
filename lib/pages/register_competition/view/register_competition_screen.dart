import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/register_competition_controller.dart';
import 'register_competition_individual.dart';
import 'register_competition_team.dart';

class RegisterCompetitionScreen extends GetView<RegisterCompetitionController> {
  const RegisterCompetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ObxValue(
        (type) {
          switch (type.value) {
            case RegisterCompetitionType.Team:
              return RegisterCompetitionTeam();
            case RegisterCompetitionType.Individual:
              return const RegisterCompetitionIndividual();
          }
        },
        controller.state.competitionType,
      ),
    );
  }
}

enum RegisterCompetitionType { Team, Individual }
