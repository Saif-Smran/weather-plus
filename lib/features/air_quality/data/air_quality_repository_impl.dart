import '../domain/air_quality_repository.dart';
import '../domain/entities/air_quality.dart';
import 'air_quality_remote_source.dart';

class AirQualityRepositoryImpl implements AirQualityRepository {
  const AirQualityRepositoryImpl(this._remoteSource);

  final AirQualityRemoteSource _remoteSource;

  @override
  Future<AirQuality> getAirQuality(double latitude, double longitude) async {
    final dto = await _remoteSource.fetchAirQuality(
      latitude: latitude,
      longitude: longitude,
    );
    return dto.toEntity();
  }
}

