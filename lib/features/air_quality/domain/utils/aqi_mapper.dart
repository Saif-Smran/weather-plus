import 'package:flutter/material.dart';

enum AqiCategory {
  good,
  moderate,
  unhealthyForSensitive,
  unhealthy,
  veryUnhealthy,
  hazardous,
}

class AqiInfo {
  const AqiInfo({
    required this.category,
    required this.label,
    required this.description,
    required this.color,
  });

  final AqiCategory category;
  final String label;
  final String description;
  final Color color;
}

AqiInfo mapAqiCategory(int aqi, {bool isBengali = false}) {
  if (aqi <= 50) {
    return AqiInfo(
      category: AqiCategory.good,
      label: isBengali ? 'ভালো' : 'Good',
      description: isBengali
          ? 'বাতাসের মান সন্তোষজনক এবং এতে কোনো স্বাস্থ্যঝুঁকি নেই।'
          : 'Air quality is satisfactory and poses little or no risk.',
      color: const Color(0xFF4CAF50),
    );
  }
  if (aqi <= 100) {
    return AqiInfo(
      category: AqiCategory.moderate,
      label: isBengali ? 'সহনীয়' : 'Moderate',
      description: isBengali
          ? 'বাতাসের মান গ্রহণযোগ্য; তবে সংবেদনশীল ব্যক্তিরা দীর্ঘক্ষণ বাইরে থাকা সীমিত করতে পারেন।'
          : 'Acceptable; sensitive individuals should consider limiting prolonged outdoor exertion.',
      color: const Color(0xFFFFB300),
    );
  }
  if (aqi <= 150) {
    return AqiInfo(
      category: AqiCategory.unhealthyForSensitive,
      label: isBengali ? 'সংবেদনশীলদের জন্য অস্বাস্থ্যকর' : 'Unhealthy for Sensitive Groups',
      description: isBengali
          ? 'সংবেদনশীল ব্যক্তিদের স্বাস্থ্যগত সমস্যা দেখা দিতে পারে।'
          : 'Members of sensitive groups may experience health effects.',
      color: const Color(0xFFFF9800),
    );
  }
  if (aqi <= 200) {
    return AqiInfo(
      category: AqiCategory.unhealthy,
      label: isBengali ? 'অস্বাস্থ্যকর' : 'Unhealthy',
      description: isBengali
          ? 'সবার ক্ষেত্রেই সাধারণ স্বাস্থ্য সমস্যা দেখা দিতে পারে।'
          : 'Everyone may begin to experience health effects.',
      color: const Color(0xFFE53935),
    );
  }
  if (aqi <= 300) {
    return AqiInfo(
      category: AqiCategory.veryUnhealthy,
      label: isBengali ? 'খুবই অস্বাস্থ্যকর' : 'Very Unhealthy',
      description: isBengali
          ? 'জরুরি স্বাস্থ্য সতর্কতা: সবার জন্যই গুরুতর স্বাস্থ্য ঝুঁকির সম্ভাবনা।'
          : 'Health alert: risk of health effects is increased for everyone.',
      color: const Color(0xFF8E24AA),
    );
  }
  return AqiInfo(
    category: AqiCategory.hazardous,
    label: isBengali ? 'বিপজ্জনক' : 'Hazardous',
    description: isBengali
        ? 'জরুরি বিপজ্জনক অবস্থা। পুরো জনগোষ্ঠী মারাত্মকভাবে ক্ষতিগ্রস্ত হতে পারে।'
        : 'Health warning of emergency conditions. Entire population is likely affected.',
    color: const Color(0xFFB71C1C),
  );
}

