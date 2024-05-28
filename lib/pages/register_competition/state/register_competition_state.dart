import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/register_competition_screen.dart';

class RegisterCompetitionState {
  Rx<RegisterCompetitionType> competitionType = RegisterCompetitionType.Team.obs;
  final RxList<dynamic> selectedTeamMembers = RxList();
  final Rx<XFile?> selectedLogo = Rx(null);
}
