import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/location_service.dart';
import '../../core/constants/app_config.dart';

class LiveMapScreen extends StatefulWidget {
  const LiveMapScreen({super.key});

  @override
  State<LiveMapScreen> createState() => _LiveMapScreenState();
}

class _LiveMapScreenState extends State<LiveMapScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final LocationService _locationService = LocationService();
  
  StreamSubscription<Position>? _positionStream;
  Position? _currentPosition;
  bool _isInsideGeofence = false;

  // Example Crime Scene Center (Mock for demonstration, should come from API)
  final LatLng _crimeSceneCenter = const LatLng(23.8103, 90.4125); // Dhaka, BD

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  Future<void> _startTracking() async {
    final hasPermission = await _locationService.handleLocationPermission();
    if (!hasPermission) return;

    final position = await _locationService.getCurrentPosition();
    if (position != null) {
      _updateGeofenceStatus(position);
      setState(() {
        _currentPosition = position;
      });
      _moveCamera(position);
    }

    _positionStream = _locationService.getLocationStream().listen((Position position) {
      _updateGeofenceStatus(position);
      setState(() {
        _currentPosition = position;
      });
    });
  }

  void _updateGeofenceStatus(Position position) {
    _isInsideGeofence = _locationService.isInsideGeofence(
      currentPosition: position,
      centerLatitude: _crimeSceneCenter.latitude,
      centerLongitude: _crimeSceneCenter.longitude,
      radiusInMeters: AppConfig.defaultGeofenceRadiusMeters,
    );
  }

  Future<void> _moveCamera(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16.0,
      ),
    ));
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking & Geofence'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _crimeSceneCenter,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            circles: {
              Circle(
                circleId: const CircleId('crime_scene_geofence'),
                center: _crimeSceneCenter,
                radius: AppConfig.defaultGeofenceRadiusMeters,
                fillColor: _isInsideGeofence 
                    ? AppColors.primary.withOpacity(0.2) 
                    : AppColors.error.withOpacity(0.2),
                strokeColor: _isInsideGeofence ? AppColors.primary : AppColors.error,
                strokeWidth: 2,
              )
            },
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    _isInsideGeofence ? Icons.check_circle : Icons.warning,
                    color: _isInsideGeofence ? AppColors.primary : AppColors.error,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _isInsideGeofence 
                        ? 'Status: Inside Secure Geofence' 
                        : 'Warning: Outside Crime Scene Radius',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isInsideGeofence ? AppColors.primary : AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
