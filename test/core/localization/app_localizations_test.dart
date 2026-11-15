import 'package:flutter_test/flutter_test.dart';
import 'package:weather_plus/core/localization/app_localizations.dart';

void main() {
  group('AppLocalizations', () {
    test('English localizations provide expected labels', () {
      const l10n = AppLocalizations(AppLanguage.english);

      expect(l10n.appTitle, 'Weather+');
      expect(l10n.currentLocation, 'Current location');
      expect(l10n.hourlyForecast, 'Hourly Forecast');
      expect(l10n.sevenDayForecast, '7-Day Forecast');
      expect(l10n.humidity, 'HUMIDITY');
      expect(l10n.isBengali, isFalse);
    });

    test('Bengali localizations provide expected Bengali labels', () {
      const l10n = AppLocalizations(AppLanguage.bengali);

      expect(l10n.appTitle, 'ওয়েদার+');
      expect(l10n.currentLocation, 'বর্তমান অবস্থান');
      expect(l10n.hourlyForecast, 'ঘণ্টাভিত্তিক পূর্বাভাস');
      expect(l10n.sevenDayForecast, '৭ দিনের পূর্বাভাস');
      expect(l10n.humidity, 'আর্দ্রতা');
      expect(l10n.wind, 'বাতাস');
      expect(l10n.uvIndex, 'ইউভি সূচক');
      expect(l10n.sunrise, 'সূর্যোদয়');
      expect(l10n.sunset, 'সূর্যাস্ত');
      expect(l10n.isBengali, isTrue);
    });

    test('formatNumber translates digits to Bengali numerals', () {
      const l10nBn = AppLocalizations(AppLanguage.bengali);
      const l10nEn = AppLocalizations(AppLanguage.english);

      expect(l10nBn.formatNumber(25), '২৫');
      expect(l10nBn.formatNumber(100), '১০০');
      expect(l10nEn.formatNumber(25), '25');
    });

    test('translates weather condition descriptions to Bengali', () {
      const l10n = AppLocalizations(AppLanguage.bengali);

      expect(l10n.translateWeather('Clear sky'), 'পরিষ্কার আকাশ');
      expect(l10n.translateWeather('Rain'), 'বৃষ্টি');
      expect(l10n.translateWeather('Thunderstorm'), 'বজ্রঝড়');
      expect(l10n.translateWeather('Overcast'), 'মেঘাচ্ছন্ন');
    });
  });
}

