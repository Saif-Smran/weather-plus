import 'package:flutter/material.dart';

enum AppLanguage {
  english('en', 'English'),
  bengali('bn', 'বাংলা');

  const AppLanguage(this.code, this.displayName);

  final String code;
  final String displayName;

  Locale get locale => Locale(code);
}

class AppLocalizations {
  const AppLocalizations(this.language);

  final AppLanguage language;

  bool get isBengali => language == AppLanguage.bengali;

  // General App & Navigation
  String get appTitle => isBengali ? 'ওয়েদার+' : 'Weather+';
  String get currentLocation => isBengali ? 'বর্তমান অবস্থান' : 'Current location';
  String get saveCity => isBengali ? 'শহর সংরক্ষণ' : 'Save city';
  String get citySaved => isBengali ? 'শহর সংরক্ষিত হয়েছে' : 'City saved to favorites';
  String get cityAlreadySaved => isBengali ? 'শহর আগেই সংরক্ষিত আছে' : 'City already saved';
  String get searchCitiesTooltip => isBengali ? 'শহর অনুসন্ধান' : 'Search cities';
  String get savedCitiesTooltip => isBengali ? 'সংরক্ষিত শহর' : 'Saved cities';
  String get settingsTooltip => isBengali ? 'সেটিংস' : 'Settings';

  // Weather sections
  String get hourlyForecast => isBengali ? 'ঘণ্টাভিত্তিক পূর্বাভাস' : 'Hourly Forecast';
  String get trendsTitle => isBengali ? '২৪ ঘণ্টার প্রবণতা' : '24-HOUR TRENDS';
  String get tempTab => isBengali ? 'তাপমাত্রা' : 'Temp';
  String get rainTab => isBengali ? 'বৃষ্টি' : 'Rain';
  String get sevenDayForecast => isBengali ? '৭ দিনের পূর্বাভাস' : '7-Day Forecast';
  String get airQualityIndex => isBengali ? 'বায়ু মান সূচক' : 'AIR QUALITY INDEX';
  String get todayAtAGlance => isBengali ? 'এক নজরে আজকের আবহাওয়া' : 'Today at a Glance';

  // Metrics
  String get humidity => isBengali ? 'আর্দ্রতা' : 'HUMIDITY';
  String get wind => isBengali ? 'বাতাস' : 'WIND';
  String get uvIndex => isBengali ? 'ইউভি সূচক' : 'UV INDEX';
  String get sunrise => isBengali ? 'সূর্যোদয়' : 'SUNRISE';
  String get sunset => isBengali ? 'সূর্যাস্ত' : 'SUNSET';
  String get updated => isBengali ? 'হালনাগাদ' : 'UPDATED';
  String get speedLabel => isBengali ? 'গতিবেগ' : 'Speed';
  String get liveDataLabel => isBengali ? 'সরাসরি তথ্য' : 'Live data';
  String get dawnLabel => isBengali ? 'ভোর' : 'Dawn';
  String get duskLabel => isBengali ? 'সন্ধ্যা' : 'Dusk';

  // Status & Qualifiers
  String get now => isBengali ? 'এখন' : 'Now';
  String get today => isBengali ? 'আজ' : 'Today';
  String get feelsLike => isBengali ? 'অনুভূত হচ্ছে' : 'Feels like';
  String get offlineCache => isBengali ? 'অফলাইন ক্যাশ' : 'Offline cache';
  String get noInternetBanner => isBengali
      ? 'ইন্টারনেট সংযোগ নেই • অফলাইন তথ্য প্রদর্শিত হচ্ছে'
      : 'No internet connection • Showing offline data';

  // Comfort labels
  String get dry => isBengali ? 'শুষ্ক' : 'Dry';
  String get comfortable => isBengali ? 'স্বস্তিদায়ক' : 'Comfortable';
  String get humid => isBengali ? 'আর্দ্র' : 'Humid';

  // UV categories
  String get uvLow => isBengali ? 'কম' : 'Low';
  String get uvModerate => isBengali ? 'মাঝারি' : 'Moderate';
  String get uvHigh => isBengali ? 'উচ্চ' : 'High';
  String get uvVeryHigh => isBengali ? 'খুব উচ্চ' : 'Very High';

  // Settings
  String get settingsTitle => isBengali ? 'সেটিংস' : 'Settings';
  String get languageTitle => isBengali ? 'ভাষা (Language)' : 'Language';
  String get temperatureUnitTitle => isBengali ? 'তাপমাত্রার একক' : 'Temperature Unit';
  String get windSpeedUnitTitle => isBengali ? 'বাতাসের গতির একক' : 'Wind Speed Unit';
  String get themePreferenceTitle => isBengali ? 'থিম পছন্দ' : 'Theme Preference';
  String get rainAlertsTitle => isBengali ? 'বৃষ্টির সতর্কতা' : 'Rain Alerts';
  String get rainAlertsSubtitle => isBengali
      ? 'বৃষ্টির সম্ভাবনা থাকলে স্বয়ংক্রিয় বিজ্ঞপ্তি পান'
      : 'Get notified when rain is forecasted';

  // Weather Condition translations
  String translateWeather(String description) {
    if (!isBengali) return description;
    switch (description.toLowerCase()) {
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

  // Digits translation helper
  String formatNumber(num number) {
    if (!isBengali) return number.toString();
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    String str = number.toString();
    for (int i = 0; i < 10; i++) {
      str = str.replaceAll(englishDigits[i], bengaliDigits[i]);
    }
    return str;
  }
}

