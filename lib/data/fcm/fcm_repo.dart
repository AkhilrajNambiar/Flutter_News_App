import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:news_feed_app/data/preferences.dart';
import 'package:news_feed_app/utilities/constants/my_env_keys.dart';

class FcmRepository {
  FcmRepository({required PreferenceManager preferenceManager}) {
    _firebaseMessaging = FirebaseMessaging.instance;
    _preferenceManager = preferenceManager;
  }
  late final FirebaseMessaging _firebaseMessaging;
  late final PreferenceManager _preferenceManager;

  Future<String> getToken() async {
    if (_preferenceManager.getFcmToken().isNotEmpty) {
      return _preferenceManager.getFcmToken();
    } else {
      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      var fcmToken = await _firebaseMessaging.getToken(
        vapidKey: const String.fromEnvironment(NewsEnvKeys.vapidKey),
      );
      await _preferenceManager.setFcmToken(fcmToken ?? '');
      return fcmToken ?? '';
    }
  }
}
