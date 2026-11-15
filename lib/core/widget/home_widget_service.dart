import 'package:home_widget/home_widget.dart';

import '../../features/weather/domain/entities/weather.dart';
import '../utils/weather_code_mapper.dart';

class HomeWidgetService {
  const HomeWidgetService._();

  static const _androidWidgetName = 'WeatherWidgetProvider';

  static Future<void> updateWeatherWidget({
    required Weather weather,
    required String cityName,
  }) async {
    try {
      final condition = weatherCodeInfo(weather.weatherCode);
      final today = weather.daily.isNotEmpty ? weather.daily.first : null;

      await HomeWidget.saveWidgetData<String>('widget_city', cityName);
      await HomeWidget.saveWidgetData<String>(
        'widget_temp',
        '${weather.temperature.round()}°',
      );
      await HomeWidget.saveWidgetData<String>(
        'widget_condition',
        condition.description,
      );
      await HomeWidget.saveWidgetData<String>(
        'widget_icon',
        condition.icon,
      );
      if (today != null) {
        await HomeWidget.saveWidgetData<String>(
          'widget_high_low',
          'H: ${today.maxTemperature.round()}°  L: ${today.minTemperature.round()}°',
        );
      }
      await HomeWidget.updateWidget(
        name: _androidWidgetName,
        androidName: _androidWidgetName,
      );
    } catch (_) {
      // Silently ignore widget platform errors in unsupported test environments
    }
  }
}

