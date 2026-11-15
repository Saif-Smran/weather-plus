import 'entities/air_quality.dart';

abstract class AirQualityRepository {
  Future<AirQuality> getAirQuality(double latitude, double longitude);
}

