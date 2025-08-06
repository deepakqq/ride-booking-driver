import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/core/values/app_spacing.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_btn_small.dart';
import 'package:annale_driver/modules/business_my_vehicle/widgets/business_show_rating.dart';
import 'package:annale_driver/modules/drivers/views/driver_detail_screen.dart';
import 'package:annale_driver/widgets/app_text.dart';
import 'package:annale_driver/widgets/dialogs/animatated_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DriverListSheet extends StatelessWidget {
  const DriverListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drivers = [
      {
        "name": "Ruben",
        "title": "Owner",
        "rating": 4.9,
        "vehicle": "Vespa",
        "image": "assets/images/user-avatar1.png",
      },
      {
        "name": "Alfonso",
        "title": "Owner",
        "rating": 4.9,
        "vehicle": "Vespa",
        "image": "assets/images/user-avatar1.png",
      },
      {
        "name": "Jaydon",
        "title": "Owner",
        "rating": 4.9,
        "vehicle": "Pulsar 150",
        "image": "assets/images/user-avatar1.png",
      },
      {
        "name": "James",
        "title": "Owner",
        "rating": 4.9,
        "vehicle": "Vespa",
        "image": "assets/images/user-avatar1.png",
      },
      {
        "name": "Zaire",
        "title": "Owner",
        "rating": 4.9,
        "vehicle": "Pulsar 150",
        "image": "assets/images/user-avatar1.png",
      },
      {
        "name": "Michael",
        "title": "Owner",
        "rating": 4.8,
        "vehicle": "Honda Activa",
        "image": "assets/images/user-avatar1.png",
      },
    ];

    final maxHeight = MediaQuery.of(context).size.height - 100.h;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r20.copyWith(
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.height8,

          AppSpacing.height16,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.black),
                ),
                AppSpacing.width16,
                AppText(
                  text: "Our Drivers",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          AppSpacing.height8,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                return DriverCard(
                  name: drivers[index]["name"]!,
                  title: drivers[index]["title"]!,
                  rating: drivers[index]["rating"] as double,
                  vehicle: drivers[index]["vehicle"]!,
                  image: drivers[index]["image"]!,
                  onAppoint: () {
                    showAnimatadSuccessDialog(
                      context,
                      message:
                          "You successfully add this driver with this bike.",
                      onDismiss: () {
                        Get.back();
                      },
                    );
                  },
                  onDetail: () {
                    Get.back();
                    Get.to(DriverDetailsScreen(forAppoint: true));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String name;
  final String title;
  final double rating;
  final String vehicle;
  final String image;
  final VoidCallback onAppoint;
  final VoidCallback onDetail;

  const DriverCard({
    super.key,
    required this.name,
    required this.title,
    required this.rating,
    required this.vehicle,
    required this.image,
    required this.onAppoint,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.r16,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5.r),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppRadius.r20,
                child: Image.asset(
                  image,
                  width: 100.r,
                  height: 60.r,
                  fit: BoxFit.cover,
                ),
              ),
              AppSpacing.width16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText(
                          text: "$name",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        AppText(
                          text: " . $title",
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    AppSpacing.height4,
                    BusinessShowRating(rating: rating.toString()),
                    AppSpacing.height4,
                    AppText(text: vehicle, fontSize: 13, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          AppSpacing.height8,
          Row(
            children: [
              Expanded(
                child: BusinessBtnSmall(onTap: onAppoint, title: "Appoint him"),
              ),
              AppSpacing.width16,
              Expanded(
                child: BusinessBtnSmall(
                  onTap: onDetail,
                  title: "Detail",
                  borderButton: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
