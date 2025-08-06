import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusinessHomeController extends GetxController {
  RxBool showSearchUI = false.obs;
  void toggleSearchUI(bool value) => showSearchUI.value = value;

  Rx<RideFlowState> rideState = RideFlowState.searchLocation.obs;

  RxBool driving = false.obs;

  void goToRideOptions() => rideState.value = RideFlowState.rideOptions;
  void goToLookingForDriver() {
    rideState.value = RideFlowState.lookingForDriver;
    driving.value = true;
  }

  void goToDriverAssigned() => rideState.value = RideFlowState.driverAssigned;
  void resetRideFlow() => rideState.value = RideFlowState.searchLocation;

  void endRideFLow() {
    Get.back();
    driving.value = false;
    rideState.value = RideFlowState.searchLocation;
  }

  void trackRide() {
    rideState.value = RideFlowState.driverAssigned;
  }

  // all map related code with var

  final Completer<GoogleMapController> mapController = Completer();
  RxSet<Marker> markers = <Marker>{}.obs;
  RxSet<Polyline> polylines = <Polyline>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockDriverMarkers();
    // _loadUserAndDestinationMarkersAndPolyline();
  }

  void _loadMockDriverMarkers() async {
    final BitmapDescriptor driverIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/icons/icon-map-driver.png',
    );

    final List<LatLng> driverLocations = [
      LatLng(40.748817, -73.985428), // Driver 1
      LatLng(40.749817, -73.984428), // Driver 2
      LatLng(40.748217, -73.986428),
      LatLng(40.758896, -73.985130), // Times Square
    ];

    final mockMarkers = driverLocations.map((location) {
      return Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        icon: driverIcon,
      );
    }).toSet();

    markers.value.addAll(mockMarkers);
  }

  void _loadUserAndDestinationMarkersAndPolyline() async {
    final BitmapDescriptor pickupIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/icons/icon-start.png',
    );

    final BitmapDescriptor destinationIcon =
        await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)),
          'assets/images/icons/icon-end.png',
        );

    // const pickup = LatLng(40.741895, -73.989308); // Flatiron
    // const destination = LatLng(40.712776, -74.005974); // Wall Street
    // Pickup: Times Square, NY

    markers.value.addAll({
      Marker(
        markerId: MarkerId('pickup'),
        position: pickup,
        icon: pickupIcon,
        infoWindow: InfoWindow(title: 'Pickup'),
      ),
      Marker(
        markerId: MarkerId('destination'),
        position: destination,
        icon: destinationIcon,
        infoWindow: InfoWindow(title: 'Destination'),
      ),
    });

    polylines.value.add(
      Polyline(
        polylineId: PolylineId('route'),
        points: [pickup, destination],
        color: Colors.green,
        width: 5,
      ),
    );
  }

  final LatLng pickup = LatLng(40.7580, -73.9855);

  // Destination: Rockefeller Center (nearby)
  final LatLng destination = LatLng(40.7587, -73.9787);
  void addPolyline() {
    polylines.clear();
    final polyline = Polyline(
      polylineId: const PolylineId("route"),
      color: Colors.blue,
      width: 5,
      points: [pickup, destination],
    );
    polylines.add(polyline);
    update(); // For GetX widgets to rebuild if needed
  }
}

enum RideFlowState {
  searchLocation,
  rideOptions,
  lookingForDriver,
  driverAssigned,
}
