import 'package:annale_driver/core/values/app_images.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  final List<String> menuItems = ["Daily", "Weekly", "Monthly"];
  RxString selectedMenuItem = "Daily".obs;

  RxString earningScreenTitle = 'Daily'.obs;

  void onMenuItemSelected(String value) {
    selectedMenuItem.value = value;
    earningScreenTitle.value = value;
    itemsLength.value = 4;
  }

  RxInt itemsLength = 4.obs;

  RxBool showSelectBankSection = false.obs;

  List<Map<String, String?>> paymentHistoryData = [
    {
      'bigText': '123 Main St to 456 Oak Ave',
      'smallText': '04:15 PM · \$12.50',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Tip Received #0124',
      'smallText': '04:10 PM · \$2.00',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': '789 Pine St to 321 Elm St',
      'smallText': '03:55 PM · \$8.75',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': '404 Cedar Ln to 505 Birch Rd',
      'smallText': '03:20 PM · \$15.25',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Refer a friend',
      'smallText': '03:00 PM · + \$10.00 Referral',
      'iconPath': "assets/images/icons/icon-re-fr.png",
    },

    {
      'bigText': 'Tip Received #0125',
      'smallText': '03:15 PM · \$3.50',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': 'Complete 5 trips',
      'smallText': '05:00 PM · + \$5.00 Bonus',
      'iconPath': "assets/images/icons/icon-trophy.png",
    },
    {
      'bigText': '111 Maple Ave to 222 Willow Dr',
      'smallText': '02:40 PM · \$10.00',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': '333 Oakwood St to 444 Lakeside Pl',
      'smallText': '02:05 PM · \$9.80',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Tip Received #0126',
      'smallText': '02:00 PM · \$1.50',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': '555 Riverfront Blvd to 666 Hilltop Rd',
      'smallText': '01:30 PM · \$18.45',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': '777 Sunset Dr to 888 Sunrise Blvd',
      'smallText': '01:00 PM · \$7.90',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Tip Received #0127',
      'smallText': '12:55 PM · \$5.00',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': '999 Ocean View Ave to 101 Mountain Trl',
      'smallText': '12:20 PM · \$21.10',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': '202 Valley Rd to 303 Highland Ave',
      'smallText': '11:45 AM · \$11.60',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Tip Received #0128',
      'smallText': '11:40 AM · \$2.50',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': '404 Meadow Ln to 505 Forest Dr',
      'smallText': '11:00 AM · \$14.30',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': '606 Park Pl to 707 Main St',
      'smallText': '10:30 AM · \$6.20',
      'iconPath': AppImages.iconRideBike,
    },
    {
      'bigText': 'Tip Received #0129',
      'smallText': '10:25 AM · \$4.00',
      'iconPath': "assets/images/icons/icon-tip.png",
    },
    {
      'bigText': '808 Central Ave to 909 North Blvd',
      'smallText': '09:50 AM · \$13.75',
      'iconPath': AppImages.iconRideBike,
    },
  ];
}
