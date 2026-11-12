class City {
  const City({
    required this.name,
    required this.country,
    required this.adminRegion,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final String country;
  final String? adminRegion;
  final double latitude;
  final double longitude;
}
