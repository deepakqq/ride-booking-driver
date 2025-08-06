// import 'package:annale_driver/modules/business_home/controllers/business_home_controller.dart';
// import 'package:annale_driver/modules/business_home/widgets/business_home_bottom_section.dart';
// import 'package:annale_driver/modules/business_home/widgets/live_location_btn.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class BusinessHomeScreen extends GetView<BusinessHomeController> {
//   const BusinessHomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.center,
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               height: Get.height * .5,
//               child: GetBuilder<BusinessHomeController>(
//                 builder: (controller) => GoogleMap(
//                   initialCameraPosition: const CameraPosition(
//                     target: LatLng(20.5937, 78.9629),
//                     zoom: 5,
//                   ),
//                   markers: controller.markers,
//                   onMapCreated: (GoogleMapController mapController) {
//                     controller.googleMapController.complete(mapController);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: BusinessHomeBottomSection(),
//           ),

//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 130.h),
//               child: LiveLocationBtn(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:annale_driver/modules/business_home/controllers/business_home_controller.dart';
import 'package:annale_driver/modules/business_home/widgets/business_home_bottom_section.dart';
import 'package:annale_driver/modules/business_home/widgets/live_location_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusinessHomeScreen extends GetView<BusinessHomeController> {
  const BusinessHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: Get.height * .5,
              child: Obx(
                () => GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(40.7580, -73.9855),
                    zoom: 15.0,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {
                    if (!controller.mapController.isCompleted) {
                      controller.mapController.complete(googleMapController);
                      controller.addPolyline();
                    }
                  },
                  markers: controller.markers.value,

                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BusinessHomeBottomSection(),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 130.h),
              child: LiveLocationBtn(),
            ),
          ),
        ],
      ),
    );
  }
}
