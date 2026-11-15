class WeatherCodeInfo {
  const WeatherCodeInfo(this.description, this.icon);

  final String description;
  final String icon;
}

WeatherCodeInfo weatherCodeInfo(
  int code, {
  bool isDay = true,
  bool isBengali = false,
}) {
  final info = _resolveBaseInfo(code, isDay);
  if (!isBengali) return info;
  return WeatherCodeInfo(_toBengaliDescription(info.description), info.icon);
}

WeatherCodeInfo _resolveBaseInfo(int code, bool isDay) {
  if (code == 0) {
    return WeatherCodeInfo('Clear sky', isDay ? '☀️' : '🌙');
  }
  if (code == 1 || code == 2) {
    return WeatherCodeInfo('Partly cloudy', isDay ? '⛅' : '☁️');
  }
  if (code == 3) return const WeatherCodeInfo('Overcast', '☁️');
  if (code >= 45 && code <= 48) {
    return const WeatherCodeInfo('Fog', '🌫️');
  }
  if (code >= 51 && code <= 57) {
    return const WeatherCodeInfo('Drizzle', '🌦️');
  }
  if (code >= 61 && code <= 67) {
    return const WeatherCodeInfo('Rain', '🌧️');
  }
  if (code >= 71 && code <= 77) {
    return const WeatherCodeInfo('Snow', '🌨️');
  }
  if (code >= 80 && code <= 82) {
    return WeatherCodeInfo('Rain showers', isDay ? '🌦️' : '🌧️');
  }
  if (code == 85 || code == 86) {
    return const WeatherCodeInfo('Snow showers', '🌨️');
  }
  if (code == 95 || code == 96 || code == 99) {
    return const WeatherCodeInfo('Thunderstorm', '⛈️');
  }
  return const WeatherCodeInfo('Unknown conditions', '🌡️');
}

String _toBengaliDescription(String english) {
  switch (english.toLowerCase()) {
    case 'clear sky':
      return 'পরিষ্কার আকাশ';
    case 'partly cloudy':
      return 'আংশিক মেঘলা';
    case 'overcast':
      return 'মেঘাচ্ছন্ন';
    case 'fog':
      return 'কুয়াশা';
    case 'drizzle':
      return 'গুড়ি গুড়ি বৃষ্টি';
    case 'rain':
      return 'বৃষ্টি';
    case 'snow':
      return 'তুষারপাত';
    case 'rain showers':
      return 'বৃষ্টির ধারা';
    case 'snow showers':
      return 'তুষার ঝরনা';
    case 'thunderstorm':
      return 'বজ্রঝড়';
    default:
      return 'অজানা আবহাওয়া';
  }
}
