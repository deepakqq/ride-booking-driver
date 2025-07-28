import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  var pushNotification = false.obs;
  var emailNotification = false.obs;
  var smsNotification = false.obs;

  var rideUpdates = false.obs;
  var promotions = false.obs;
  var news = false.obs;
}
