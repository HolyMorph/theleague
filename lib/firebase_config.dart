import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseConfig {
  static StreamSubscription? _onMessageOpenedStream;
  static StreamSubscription? _onMessageStream;

  ///Апп-с гарахад мэдэгдэлтэй холбоотой хувьсагчуудыг санах ойгоос устга
  static void dispose() {
    _onMessageStream?.cancel();
    _onMessageOpenedStream?.cancel();
  }

  ///Firebase notification сервис тохиргоо хийх
  ///
  /// [onNotificationReceived] -> мэдэгдэл ирсэн үед дуудагдах функц
  ///
  /// [onMessageOpenedApp] -> Мэдэгдэл ирээд тухайн мэдэгдэл дээр дараад апп нээгдэхэд
  /// дуудагдах функц
  ///
  /// [onTokenRefreshed] -> мэдэгдлийн токен өөрчилөгдсөн тохиолдолд дуудагдах функц
  ///
  /// [onBackgroundMessage] -> Апп background орчинд байгаа үед мэдэгдэл ирвэл дуудагдах функц
  static Future<void> initFirebase({
    Function(RemoteMessage)? onNotificationReceived,
    Function(RemoteMessage)? onMessageOpenedApp,
    Function(String)? onTokenRefreshed,
    Future<void> Function(RemoteMessage)? onBackgroundMessage,
  }) async {
    await Firebase.initializeApp();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    /// Ios Device-дээр notification яавуулах эрхийн тохиргоог зохицуулах
    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    messaging.onTokenRefresh.listen(onTokenRefreshed);

    messaging.getToken().then((token) {
      if (onTokenRefreshed != null && token != null) {
        onTokenRefreshed(token);
      }
    });

    ///App-нээлттэй баайхад notification сонсох
    _onMessageStream = FirebaseMessaging.onMessage.listen(onNotificationReceived);

    ///Мэдэгдэл дээр дарж апп нээгдэхэд ажиллах функц
    _onMessageOpenedStream = FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);

    ///Апп хаалттай үед notification ирвэл дуудагдах функц тохируулах
    if (onBackgroundMessage != null) {
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    }
  }

  ///Notification сервисд topic subscribe хийх
  ///
  /// [topic] -> subscribe хийх гэж буй topic
  static Future<void> subscribeToTopic(String topic) async => FirebaseMessaging.instance.subscribeToTopic(topic);

  ///Notification сервисд unsubscribe хийх
  ///
  /// [topic] -> unsubscribe хийх гэж буй topic
  static Future<void> unSubscribeToTopic(String topic) async => FirebaseMessaging.instance.unsubscribeFromTopic(topic);
}
