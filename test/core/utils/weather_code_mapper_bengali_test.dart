import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/utils/weather_code_mapper.dart';

void main() {
  group('WeatherCodeMapper with Bengali translations', () {
    test('maps code 0 to Bengali পরিষ্কার আকাশ', () {
      final info = weatherCodeInfo(0, isBengali: true);
      expect(info.description, 'পরিষ্কার আকাশ');
      expect(info.icon, '☀️');
    });

    test('maps rain and thunderstorm to Bengali', () {
      expect(weatherCodeInfo(61, isBengali: true).description, 'বৃষ্টি');
      expect(weatherCodeInfo(95, isBengali: true).description, 'বজ্রঝড়');
      expect(weatherCodeInfo(3, isBengali: true).description, 'মেঘাচ্ছন্ন');
    });

    test('retains English by default', () {
      expect(weatherCodeInfo(0).description, 'Clear sky');
      expect(weatherCodeInfo(61).description, 'Rain');
    });
  });
}

