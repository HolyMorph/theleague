class Constants {
  /// Token string to get token from local storage
  static String FCMToken = 'fcmToken';
  static String META_DATA = 'metadata';
  static String PlayersFemale = 'playersFemale';
  static String PlayersMale = 'playersMale';
  static String TEAMS = 'teams';
  static String TIMESTAMP = 'timestamp';
  static String TOKEN = 'token';
  static String TicketCode = 'ticketCode';

  ///Хөгжүүлэлтийн орчны URL ашиглах эсэх
  ///
  /// Хэрвээ true бол бүх хүсэлт хөгжүүлэлтийн URL
  /// ашиглаж дуудагдана
  static bool isDevUrl = true;

  ///SplashScreen харуулах хугацаа
  static int splashDelayMillis = 2500;
}
