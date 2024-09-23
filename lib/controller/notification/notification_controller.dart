import 'package:get/get.dart';
import 'package:news_feed_app/data/fcm/fcm_repo.dart';

class NotificationController extends GetxController {
  NotificationController({required FcmRepository fcmRepository}) {
    _fcmRepository = fcmRepository;
  }

  late final FcmRepository _fcmRepository;

  final fcmToken = ''.obs;

  Future<void> getToken() async {
    fcmToken.value = await _fcmRepository.getToken();
  }
}
