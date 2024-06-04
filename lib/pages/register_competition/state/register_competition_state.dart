import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/event_type.dart';
import '../../../utils/game_type.dart';

class RegisterCompetitionState {
  Rx<GameType> gameType = Rx(GameType.Team);
  Rx<EventType> eventType = Rx(EventType.Tournament);
  final RxList<dynamic> selectedTeamMembers = RxList();
  final Rx<XFile?> selectedLogo = Rx(null);
  final RxList myTeams = RxList();
  final RxBool isLoading = RxBool(false);
  final RxString gameId = RxString('');
  final RxString from = RxString('');
  final RxMap gameData = RxMap();
  final RxMap teamData = RxMap();
  final RxInt ticketCount = RxInt(1);
  final RxList entryList = RxList();
  final RxMap entityDetail = RxMap();
  final RxBool isCallJoin = RxBool(false);
}
