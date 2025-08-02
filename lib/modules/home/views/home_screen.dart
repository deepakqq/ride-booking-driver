import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/views/ride_nav_screen.dart';
import 'package:annale_driver/modules/home/widgets/dialog/ride_status_dialog.dart';
import 'package:annale_driver/modules/home/widgets/home_bottom_secttion.dart';
import 'package:annale_driver/modules/home/widgets/online_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RideController rideController = Get.find<RideController>();

  late final VoidCallback _statusDisposer;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rideController.startNewRideRequest();
    });

    // ignore: implicit_call_tearoffs
    _statusDisposer = ever(rideController.rideStatus, (RideStatus status) {
      if (status == RideStatus.newRequest) {
        showRideRequestDialog(
          context: context,
          onAccept: () {
            rideController.rideStatus.value = RideStatus.enRouteToPickup;

            print('Ride Accepted!');
            Navigator.of(context).pop();

            Get.to(() => RideNavScreen());
            Future.delayed(Duration(seconds: 6), () {
              rideController.rideStatus.value = RideStatus.atPickup;
              rideController.startJourney();
            });
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _statusDisposer();
    ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Container(height: 450.h, width: double.infinity),
          Positioned(
            top: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: Get.width,
              height: 300.h,
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: HomeBottomSecttion()),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120.h),
              child: OnlineBtn(
                isDarkMode: isOnline,
                onToggle: (v) {
                  isOnline = v;
                  setState(() {});
                  // showRideRequestDialog(context);
                  // showOtpBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOnline = true;
}
