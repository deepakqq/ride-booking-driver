import 'dart:async';

import 'package:annale_driver/modules/business_home/widgets/business_home_bottom_section.dart';
import 'package:annale_driver/modules/business_home/widgets/live_location_btn.dart';
import 'package:annale_driver/modules/home/controllers/ride_controller.dart';
import 'package:annale_driver/modules/home/widgets/online_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({Key? key}) : super(key: key);

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng? _currentLocation;
  BitmapDescriptor? _driverIcon;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    _initializeLocation();
  }

  Future<void> _loadCustomMarker() async {
    _driverIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/images/icons/d-location.png',
    );
  }

  Future<void> _initializeLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final locationData = await _location.getLocation();
    setState(() {
      _currentLocation = LatLng(
        locationData.latitude!,
        locationData.longitude!,
      );
      _updateMarkers();
    });

    _location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        _currentLocation = LatLng(
          newLocation.latitude!,
          newLocation.longitude!,
        );
        _updateMarkers();
      });
    });
  }

  bool _isDriverVisible = true;
  void _updateMarkers() {
    _markers.clear();
    if (_isDriverVisible && _currentLocation != null && _driverIcon != null) {
      _markers.add(
        Marker(
          markerId: const MarkerId('driver'),
          position: _currentLocation!,
          icon: _driverIcon!,
        ),
      );
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          _currentLocation == null
              ? const Center(child: CircularProgressIndicator())
              : Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: Get.height * .5,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentLocation!,
                        zoom: 15,
                      ),
                      markers: _markers,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      myLocationButtonEnabled: true,
                      zoomControlsEnabled: false,
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BusinessHomeBottomSection(),
          ),
          _isDriverVisible
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 250.h, right: 8.w),
                    child: GestureDetector(
                      onTap: () {
                        if (_currentLocation != null &&
                            _mapController != null) {
                          _mapController!.animateCamera(
                            CameraUpdate.newLatLngZoom(_currentLocation!, 15),
                          );
                        }
                      },
                      child: Image.asset(
                        "assets/images/map-my-loction.png",
                        height: 60.h,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
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
