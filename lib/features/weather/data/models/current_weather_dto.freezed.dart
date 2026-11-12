// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentWeatherDto {

 String get time; int get interval;@JsonKey(name: 'temperature_2m') double get temperature;@JsonKey(name: 'apparent_temperature') double get apparentTemperature;@JsonKey(name: 'relative_humidity_2m') int get relativeHumidity;@JsonKey(name: 'weather_code') int get weatherCode;@JsonKey(name: 'wind_speed_10m') double get windSpeed;
/// Create a copy of CurrentWeatherDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherDtoCopyWith<CurrentWeatherDto> get copyWith => _$CurrentWeatherDtoCopyWithImpl<CurrentWeatherDto>(this as CurrentWeatherDto, _$identity);

  /// Serializes this CurrentWeatherDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentWeatherDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherDto&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.interval, _this.interval) || other.interval == _this.interval)&&(identical(other.temperature, _this.temperature) || other.temperature == _this.temperature)&&(identical(other.apparentTemperature, _this.apparentTemperature) || other.apparentTemperature == _this.apparentTemperature)&&(identical(other.relativeHumidity, _this.relativeHumidity) || other.relativeHumidity == _this.relativeHumidity)&&(identical(other.weatherCode, _this.weatherCode) || other.weatherCode == _this.weatherCode)&&(identical(other.windSpeed, _this.windSpeed) || other.windSpeed == _this.windSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentWeatherDto;
  return Object.hash(runtimeType,_this.time,_this.interval,_this.temperature,_this.apparentTemperature,_this.relativeHumidity,_this.weatherCode,_this.windSpeed);
}

@override
String toString() {
  final _this = this as CurrentWeatherDto;
  return 'CurrentWeatherDto(time: ${_this.time}, interval: ${_this.interval}, temperature: ${_this.temperature}, apparentTemperature: ${_this.apparentTemperature}, relativeHumidity: ${_this.relativeHumidity}, weatherCode: ${_this.weatherCode}, windSpeed: ${_this.windSpeed})';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherDtoCopyWith<$Res>  {
  factory $CurrentWeatherDtoCopyWith(CurrentWeatherDto value, $Res Function(CurrentWeatherDto) _then) = _$CurrentWeatherDtoCopyWithImpl;
@useResult
$Res call({
 String time, int interval,@JsonKey(name: 'temperature_2m') double temperature,@JsonKey(name: 'apparent_temperature') double apparentTemperature,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity,@JsonKey(name: 'weather_code') int weatherCode,@JsonKey(name: 'wind_speed_10m') double windSpeed
});




}
/// @nodoc
class _$CurrentWeatherDtoCopyWithImpl<$Res>
    implements $CurrentWeatherDtoCopyWith<$Res> {
  _$CurrentWeatherDtoCopyWithImpl(this._self, this._then);

  final CurrentWeatherDto _self;
  final $Res Function(CurrentWeatherDto) _then;

/// Create a copy of CurrentWeatherDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? interval = null,Object? temperature = null,Object? apparentTemperature = null,Object? relativeHumidity = null,Object? weatherCode = null,Object? windSpeed = null,}) {
  return _then(CurrentWeatherDto(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,apparentTemperature: null == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity: null == relativeHumidity ? _self.relativeHumidity : relativeHumidity // ignore: cast_nullable_to_non_nullable
as int,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentWeatherDto].
extension CurrentWeatherDtoPatterns on CurrentWeatherDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  int interval, @JsonKey(name: 'temperature_2m')  double temperature, @JsonKey(name: 'apparent_temperature')  double apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity, @JsonKey(name: 'weather_code')  int weatherCode, @JsonKey(name: 'wind_speed_10m')  double windSpeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherDto() when $default != null:
return $default(_that.time,_that.interval,_that.temperature,_that.apparentTemperature,_that.relativeHumidity,_that.weatherCode,_that.windSpeed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  int interval, @JsonKey(name: 'temperature_2m')  double temperature, @JsonKey(name: 'apparent_temperature')  double apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity, @JsonKey(name: 'weather_code')  int weatherCode, @JsonKey(name: 'wind_speed_10m')  double windSpeed)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherDto():
return $default(_that.time,_that.interval,_that.temperature,_that.apparentTemperature,_that.relativeHumidity,_that.weatherCode,_that.windSpeed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  int interval, @JsonKey(name: 'temperature_2m')  double temperature, @JsonKey(name: 'apparent_temperature')  double apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity, @JsonKey(name: 'weather_code')  int weatherCode, @JsonKey(name: 'wind_speed_10m')  double windSpeed)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherDto() when $default != null:
return $default(_that.time,_that.interval,_that.temperature,_that.apparentTemperature,_that.relativeHumidity,_that.weatherCode,_that.windSpeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWeatherDto implements CurrentWeatherDto {
  const _CurrentWeatherDto({required this.time, required this.interval, @JsonKey(name: 'temperature_2m') required this.temperature, @JsonKey(name: 'apparent_temperature') required this.apparentTemperature, @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity, @JsonKey(name: 'weather_code') required this.weatherCode, @JsonKey(name: 'wind_speed_10m') required this.windSpeed});
  factory _CurrentWeatherDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherDtoFromJson(json);

@override final  String time;
@override final  int interval;
@override@JsonKey(name: 'temperature_2m') final  double temperature;
@override@JsonKey(name: 'apparent_temperature') final  double apparentTemperature;
@override@JsonKey(name: 'relative_humidity_2m') final  int relativeHumidity;
@override@JsonKey(name: 'weather_code') final  int weatherCode;
@override@JsonKey(name: 'wind_speed_10m') final  double windSpeed;

/// Create a copy of CurrentWeatherDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherDtoCopyWith<_CurrentWeatherDto> get copyWith => __$CurrentWeatherDtoCopyWithImpl<_CurrentWeatherDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherDto&&(identical(other.time, time) || other.time == time)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.apparentTemperature, apparentTemperature) || other.apparentTemperature == apparentTemperature)&&(identical(other.relativeHumidity, relativeHumidity) || other.relativeHumidity == relativeHumidity)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,time,interval,temperature,apparentTemperature,relativeHumidity,weatherCode,windSpeed);
}

@override
String toString() {
    return 'CurrentWeatherDto(time: $time, interval: $interval, temperature: $temperature, apparentTemperature: $apparentTemperature, relativeHumidity: $relativeHumidity, weatherCode: $weatherCode, windSpeed: $windSpeed)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherDtoCopyWith<$Res> implements $CurrentWeatherDtoCopyWith<$Res> {
  factory _$CurrentWeatherDtoCopyWith(_CurrentWeatherDto value, $Res Function(_CurrentWeatherDto) _then) = __$CurrentWeatherDtoCopyWithImpl;
@override @useResult
$Res call({
 String time, int interval,@JsonKey(name: 'temperature_2m') double temperature,@JsonKey(name: 'apparent_temperature') double apparentTemperature,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity,@JsonKey(name: 'weather_code') int weatherCode,@JsonKey(name: 'wind_speed_10m') double windSpeed
});




}
/// @nodoc
class __$CurrentWeatherDtoCopyWithImpl<$Res>
    implements _$CurrentWeatherDtoCopyWith<$Res> {
  __$CurrentWeatherDtoCopyWithImpl(this._self, this._then);

  final _CurrentWeatherDto _self;
  final $Res Function(_CurrentWeatherDto) _then;

/// Create a copy of CurrentWeatherDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? interval = null,Object? temperature = null,Object? apparentTemperature = null,Object? relativeHumidity = null,Object? weatherCode = null,Object? windSpeed = null,}) {
  return _then(_CurrentWeatherDto(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,apparentTemperature: null == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity: null == relativeHumidity ? _self.relativeHumidity : relativeHumidity // ignore: cast_nullable_to_non_nullable
as int,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
