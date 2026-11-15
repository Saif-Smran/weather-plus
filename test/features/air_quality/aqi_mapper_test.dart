import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/features/air_quality/domain/utils/aqi_mapper.dart';

void main() {
  group('AQI Category Mapper', () {
    test('maps 0-50 to Good', () {
      final info0 = mapAqiCategory(0);
      final info50 = mapAqiCategory(50);

      expect(info0.category, AqiCategory.good);
      expect(info0.label, 'Good');
      expect(info0.color, const Color(0xFF4CAF50));

      expect(info50.category, AqiCategory.good);
    });

    test('maps 51-100 to Moderate', () {
      final info51 = mapAqiCategory(51);
      final info100 = mapAqiCategory(100);

      expect(info51.category, AqiCategory.moderate);
      expect(info51.label, 'Moderate');
      expect(info51.color, const Color(0xFFFFB300));

      expect(info100.category, AqiCategory.moderate);
    });

    test('maps 101-150 to Unhealthy for Sensitive Groups', () {
      final info101 = mapAqiCategory(101);
      final info150 = mapAqiCategory(150);

      expect(info101.category, AqiCategory.unhealthyForSensitive);
      expect(info101.label, 'Unhealthy for Sensitive Groups');
      expect(info101.color, const Color(0xFFFF9800));

      expect(info150.category, AqiCategory.unhealthyForSensitive);
    });

    test('maps 151-200 to Unhealthy', () {
      final info151 = mapAqiCategory(151);
      final info200 = mapAqiCategory(200);

      expect(info151.category, AqiCategory.unhealthy);
      expect(info151.label, 'Unhealthy');
      expect(info151.color, const Color(0xFFE53935));

      expect(info200.category, AqiCategory.unhealthy);
    });

    test('maps 201-300 to Very Unhealthy', () {
      final info201 = mapAqiCategory(201);
      final info300 = mapAqiCategory(300);

      expect(info201.category, AqiCategory.veryUnhealthy);
      expect(info201.label, 'Very Unhealthy');
      expect(info201.color, const Color(0xFF8E24AA));

      expect(info300.category, AqiCategory.veryUnhealthy);
    });

    test('maps >300 to Hazardous', () {
      final info301 = mapAqiCategory(301);
      final info500 = mapAqiCategory(500);

      expect(info301.category, AqiCategory.hazardous);
      expect(info301.label, 'Hazardous');
      expect(info301.color, const Color(0xFFB71C1C));

      expect(info500.category, AqiCategory.hazardous);
    });

    test('returns Bengali labels and descriptions when isBengali is true', () {
      final good = mapAqiCategory(30, isBengali: true);
      expect(good.label, 'ভালো');
      expect(good.description, contains('বাতাসের মান সন্তোষজনক'));

      final mod = mapAqiCategory(80, isBengali: true);
      expect(mod.label, 'সহনীয়');

      final unhSens = mapAqiCategory(120, isBengali: true);
      expect(unhSens.label, 'সংবেদনশীলদের জন্য অস্বাস্থ্যকর');

      final unh = mapAqiCategory(180, isBengali: true);
      expect(unh.label, 'অস্বাস্থ্যকর');

      final vUnh = mapAqiCategory(250, isBengali: true);
      expect(vUnh.label, 'খুবই অস্বাস্থ্যকর');

      final haz = mapAqiCategory(400, isBengali: true);
      expect(haz.label, 'বিপজ্জনক');
    });
  });
}

