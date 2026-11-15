import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/weather/domain/entities/weather.dart';

class NotificationService {
  NotificationService() {
    _init();
  }

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  static const _lastAlertKey = 'last_rain_alert_timestamp';

  Future<void> _init() async {
    if (_initialized) return;

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
    );

    await _plugin.initialize(settings: initSettings);
    _initialized = true;
  }

  Future<bool> requestPermission() async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      final granted = await androidPlugin.requestNotificationsPermission();
      return granted ?? false;
    }
    return true;
  }

  Future<void> showRainAlert({
    required String cityName,
    required String timeStr,
    required int probability,
    bool isBengali = false,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'rain_alerts_channel',
      'Rain Alerts',
      channelDescription: 'Alerts when high chance of rain is forecasted',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    final title = isBengali
        ? 'বৃষ্টির সতর্কতা: ছাতা সাথে রাখুন! ☔'
        : 'Rain Alert: Expect Rain Soon! ☔';
    final body = isBengali
        ? '$cityName-এ $timeStr নাগাদ বৃষ্টির সম্ভাবনা $probability%।'
        : 'Rain probability is $probability% in $cityName around $timeStr.';

    await _plugin.show(
      id: 1001,
      title: title,
      body: body,
      notificationDetails: notificationDetails,
    );
  }

  Future<void> checkAndNotifyRain({
    required Weather weather,
    required String cityName,
    required bool isEnabled,
    bool isBengali = false,
  }) async {
    if (!isEnabled) return;

    final prefs = await SharedPreferences.getInstance();
    final lastAlertMillis = prefs.getInt(_lastAlertKey) ?? 0;
    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    if (nowMillis - lastAlertMillis < const Duration(hours: 4).inMilliseconds) {
      return;
    }

    for (final forecast in weather.hourly.take(12)) {
      if (forecast.precipitationProbability >= 50) {
        final timeStr =
            DateFormat.jm(isBengali ? 'bn' : 'en').format(forecast.time);
        await showRainAlert(
          cityName: cityName,
          timeStr: timeStr,
          probability: forecast.precipitationProbability,
          isBengali: isBengali,
        );
        await prefs.setInt(_lastAlertKey, nowMillis);
        break;
      }
    }
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
