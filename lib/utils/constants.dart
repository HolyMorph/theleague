class Constants {
  /// Token string to get token from local storage
  static String FCMToken = 'fcmToken';
  static String META_DATA = 'metadata';
  static String PlayersFemale = 'playersFemale';
  static String PlayersMale = 'playersMale';
  static String TEAMS = 'teams';
  static String TIMESTAMP = 'timestamp';
  static String TOKEN = 'token';
  static String USERTYPE = 'userType';
  static String TicketCode = 'ticketCode';
  static String REFRESH_TOKEN = 'refreshToken';
  static String BASE_URL = 'https://app-api.sportlab.mn/';
  static String BASE_DEV_URL = 'https://app-api.dev.sportlab.mn/';
  static String BASE_UPLOAD_URL = 'https://upload.dev.sportlab.mn/';

  ///Хөгжүүлэлтийн орчны URL ашиглах эсэх
  ///
  /// Хэрвээ true бол бүх хүсэлт хөгжүүлэлтийн URL
  /// ашиглаж дуудагдана
  static bool isDevUrl = true;

  ///SplashScreen харуулах хугацаа
  static int splashDelayMillis = 2500;
}
