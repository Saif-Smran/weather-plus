package com.hosain.weather_plus

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

class WeatherWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.weather_widget).apply {
                val city = widgetData.getString("widget_city", "Weather+")
                val temp = widgetData.getString("widget_temp", "--°")
                val condition = widgetData.getString("widget_condition", "")
                val icon = widgetData.getString("widget_icon", "☀️")
                val highLow = widgetData.getString("widget_high_low", "")

                setTextViewText(R.id.widget_city, city)
                setTextViewText(R.id.widget_temp, temp)
                setTextViewText(R.id.widget_condition, condition)
                setTextViewText(R.id.widget_icon, icon)
                setTextViewText(R.id.widget_high_low, highLow)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}

