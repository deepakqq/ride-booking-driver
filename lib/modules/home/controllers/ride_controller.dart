import 'package:annale_driver/core/values/app_images.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:async';

enum RideStatus {
  idle,
  newRequest,
  enRouteToPickup,
  atPickup,
  enRouteToDropoff,
  atDropoff,
  paymentPending,
  rideCompleted,
  rideCancelled,
}

class RideController extends GetxController {
  Rx<RideStatus> rideStatus = RideStatus.idle.obs;

  RxString riderName = 'Rebecca Davis'.obs;
  RxString riderRating = '4.4'.obs;
  RxString pickupTime = '4 min'.obs;
  RxString travelDistance = '1.4km'.obs;
  RxString pickupAddress = '8134 Franz Parkways, Suite 80...'.obs;
  RxString dropoffAddress = 'Ale\'s Park'.obs;
  RxString riderProfileAsset =
      'assets/images/rider_profile_placeholder.jpg'.obs;

  RxString currentDirectionText = 'Go straight on JSQ'.obs;
  RxString currentRoadName = 'Complex Road'.obs;
  RxString currentDirectionDistance = '400 m'.obs;
  RxString currentDirectionIcon = "".obs;
  Color? fColor = Color(0xff0B993C);
  Color? sColor = Color(0xff0DB646);
  // 'f-color': Color(0xff0B993C),
  // 's-color': Color(0xff0DB646),

  RxDouble rideFare = 125.50.obs;

  Timer? _timer;

  void startNewRideRequest() {
    _startRideRequestTimer();
  }

  void _startRideRequestTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      print('accept the ride');
      rideStatus.value = RideStatus.newRequest;
    });
  }

  void acceptRide() {
    if (rideStatus.value == RideStatus.newRequest) {
      _timer?.cancel();
      rideStatus.value = RideStatus.enRouteToPickup;
    }
  }

  void startJourney() {
    _timer?.cancel();
    int currentStep = 0;
    List<Map<String, dynamic>> pickupDirections = [
      {
        'text': 'Take right',
        'road': 'on Elm Street',
        'distance': '100 m',
        'icon': "assets/images/icons/go-up-left",
        'f-color': Color(0xffF09F02),
        's-color': Color(0xffCD8800),
      },
      //    colorFirst: Color(0xff0B993C),
      // colorSecond: Color(0xff0DB646),
      {
        'text': 'Go straight on JSQ',
        'road': 'Complex Road',
        'distance': '400 m',
        'icon': "assets/images/icons/go-turn-left",
        'f-color': Color(0xffFC0B0A),
        's-color': Color(0xffCA0908),
      },

      {
        'text': 'Go straight',
        'road': 'for destination',
        'distance': '100 m',
        'icon': "assets/images/icons/go-up-left",
        'f-color': Color(0xff0B993C),
        's-color': Color(0xff0DB646),
      },
    ];

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep < pickupDirections.length) {
        currentDirectionText.value = pickupDirections[currentStep]['text']!;
        currentRoadName.value = pickupDirections[currentStep]['road']!;
        currentDirectionDistance.value =
            pickupDirections[currentStep]['distance']!;
        currentDirectionIcon.value = pickupDirections[currentStep]['icon']!;
        fColor = pickupDirections[currentStep]['f-color']!;
        sColor = pickupDirections[currentStep]['s-color']!;
        currentStep++;
      } else {
        timer.cancel();
      }
    });
  }

  void verifyOtp() {
    rideStatus.value = RideStatus.enRouteToDropoff;
    _startDropoffJourney();
  }

  void _startDropoffJourney() {
    _timer?.cancel();
    int currentStep = 0;
    List<Map<String, String>> dropoffDirections = [
      {'text': 'Head towards', 'road': 'Main Street', 'distance': '500 m'},
      {'text': 'Turn left at', 'road': 'Oak Avenue', 'distance': '200 m'},
      {'text': 'You have arrived at', 'road': 'destination', 'distance': '0 m'},
    ];

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentStep < dropoffDirections.length) {
        currentDirectionText.value = dropoffDirections[currentStep]['text']!;
        currentRoadName.value = dropoffDirections[currentStep]['road']!;
        currentDirectionDistance.value =
            dropoffDirections[currentStep]['distance']!;
        currentStep++;
      } else {
        timer.cancel();
        rideStatus.value = RideStatus.atDropoff;
        _showPaymentPending();
      }
    });
  }

  void _showPaymentPending() {
    rideStatus.value = RideStatus.paymentPending;
  }

  void receivePayment() {
    rideStatus.value = RideStatus.rideCompleted;
    _timer?.cancel();
    Timer(const Duration(seconds: 3), () {
      resetRide();
    });
  }

  void cancelRide(String reason) {
    _timer?.cancel();
    rideStatus.value = RideStatus.rideCancelled;
    print("Ride Cancelled! Reason: $reason");
    Timer(const Duration(seconds: 3), () {
      resetRide();
    });
  }

  void resetRide() {
    _timer?.cancel();
    rideStatus.value = RideStatus.idle;
    currentDirectionText.value = 'Go straight on JSQ';
    currentRoadName.value = 'Complex Road';
    currentDirectionDistance.value = '400 m';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
