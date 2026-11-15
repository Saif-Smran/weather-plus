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

AqiInfo mapAqiCategory(int aqi) {
  if (aqi <= 50) {
    return const AqiInfo(
      category: AqiCategory.good,
      label: 'Good',
      description: 'Air quality is satisfactory and poses little or no risk.',
      color: Color(0xFF4CAF50),
    );
  }
  if (aqi <= 100) {
    return const AqiInfo(
      category: AqiCategory.moderate,
      label: 'Moderate',
      description: 'Acceptable; sensitive individuals should consider limiting prolonged outdoor exertion.',
      color: Color(0xFFFFB300),
    );
  }
  if (aqi <= 150) {
    return const AqiInfo(
      category: AqiCategory.unhealthyForSensitive,
      label: 'Unhealthy for Sensitive Groups',
      description: 'Members of sensitive groups may experience health effects.',
      color: Color(0xFFFF9800),
    );
  }
  if (aqi <= 200) {
    return const AqiInfo(
      category: AqiCategory.unhealthy,
      label: 'Unhealthy',
      description: 'Everyone may begin to experience health effects.',
      color: Color(0xFFE53935),
    );
  }
  if (aqi <= 300) {
    return const AqiInfo(
      category: AqiCategory.veryUnhealthy,
      label: 'Very Unhealthy',
      description: 'Health alert: risk of health effects is increased for everyone.',
      color: Color(0xFF8E24AA),
    );
  }
  return const AqiInfo(
    category: AqiCategory.hazardous,
    label: 'Hazardous',
    description: 'Health warning of emergency conditions. Entire population is likely affected.',
    color: Color(0xFFB71C1C),
  );
}

