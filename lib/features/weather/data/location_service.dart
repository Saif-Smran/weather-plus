import 'package:geolocator/geolocator.dart';

sealed class LocationFailure implements Exception {
  const LocationFailure();
}

final class PermissionDenied extends LocationFailure {
  const PermissionDenied();
}

final class PermissionDeniedForever extends LocationFailure {
  const PermissionDeniedForever();
}

final class ServiceDisabled extends LocationFailure {
  const ServiceDisabled();
}

class LocationService {
  Future<Position> getCurrentPosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const ServiceDisabled();
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw const PermissionDenied();
    }
    if (permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedForever();
    }

    return Geolocator.getCurrentPosition();
  }

  Future<bool> openAppSettings() => Geolocator.openAppSettings();

  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
}
