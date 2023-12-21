class Constants {
  /// Token string to get token from local storage
  static String META_DATA = 'metadata';
  static String TEAMS = 'teams';
  static String TIMESTAMP = 'timestamp';
  static String TOKEN = 'token';

  ///Хөгжүүлэлтийн орчны URL ашиглах эсэх
  ///
  /// Хэрвээ true бол бүх хүсэлт хөгжүүлэлтийн URL
  /// ашиглаж дуудагдана
  static bool isDevUrl = false;

  ///SplashScreen харуулах хугацаа
  static int splashDelayMillis = 2500;
}
