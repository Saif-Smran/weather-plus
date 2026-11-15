// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastResponseDto {

 double get latitude; double get longitude; String get timezone;@JsonKey(name: 'utc_offset_seconds') int? get utcOffsetSeconds; CurrentWeatherDto get current; HourlyDto get hourly; DailyDto get daily;
/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastResponseDtoCopyWith<ForecastResponseDto> get copyWith => _$ForecastResponseDtoCopyWithImpl<ForecastResponseDto>(this as ForecastResponseDto, _$identity);

  /// Serializes this ForecastResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastResponseDto&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.utcOffsetSeconds, _this.utcOffsetSeconds) || other.utcOffsetSeconds == _this.utcOffsetSeconds)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.hourly, _this.hourly) || other.hourly == _this.hourly)&&(identical(other.daily, _this.daily) || other.daily == _this.daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastResponseDto;
  return Object.hash(runtimeType,_this.latitude,_this.longitude,_this.timezone,_this.utcOffsetSeconds,_this.current,_this.hourly,_this.daily);
}

@override
String toString() {
  final _this = this as ForecastResponseDto;
  return 'ForecastResponseDto(latitude: ${_this.latitude}, longitude: ${_this.longitude}, timezone: ${_this.timezone}, utcOffsetSeconds: ${_this.utcOffsetSeconds}, current: ${_this.current}, hourly: ${_this.hourly}, daily: ${_this.daily})';
}


}

/// @nodoc
abstract mixin class $ForecastResponseDtoCopyWith<$Res>  {
  factory $ForecastResponseDtoCopyWith(ForecastResponseDto value, $Res Function(ForecastResponseDto) _then) = _$ForecastResponseDtoCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String timezone,@JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds, CurrentWeatherDto current, HourlyDto hourly, DailyDto daily
});


$CurrentWeatherDtoCopyWith<$Res> get current;$HourlyDtoCopyWith<$Res> get hourly;$DailyDtoCopyWith<$Res> get daily;

}
/// @nodoc
class _$ForecastResponseDtoCopyWithImpl<$Res>
    implements $ForecastResponseDtoCopyWith<$Res> {
  _$ForecastResponseDtoCopyWithImpl(this._self, this._then);

  final ForecastResponseDto _self;
  final $Res Function(ForecastResponseDto) _then;

/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? timezone = null,Object? utcOffsetSeconds = freezed,Object? current = null,Object? hourly = null,Object? daily = null,}) {
  return _then(ForecastResponseDto(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentWeatherDto,hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyDto,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyDto,
  ));
}
/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherDtoCopyWith<$Res> get current {
  
  return $CurrentWeatherDtoCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyDtoCopyWith<$Res> get hourly {
  
  return $HourlyDtoCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyDtoCopyWith<$Res> get daily {
  
  return $DailyDtoCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastResponseDto].
extension ForecastResponseDtoPatterns on ForecastResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String timezone, @JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentWeatherDto current,  HourlyDto hourly,  DailyDto daily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastResponseDto() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String timezone, @JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentWeatherDto current,  HourlyDto hourly,  DailyDto daily)  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseDto():
return $default(_that.latitude,_that.longitude,_that.timezone,_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String timezone, @JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentWeatherDto current,  HourlyDto hourly,  DailyDto daily)?  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseDto() when $default != null:
return $default(_that.latitude,_that.longitude,_that.timezone,_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastResponseDto implements ForecastResponseDto {
  const _ForecastResponseDto({required this.latitude, required this.longitude, required this.timezone, @JsonKey(name: 'utc_offset_seconds') this.utcOffsetSeconds, required this.current, required this.hourly, required this.daily});
  factory _ForecastResponseDto.fromJson(Map<String, dynamic> json) => _$ForecastResponseDtoFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String timezone;
@override@JsonKey(name: 'utc_offset_seconds') final  int? utcOffsetSeconds;
@override final  CurrentWeatherDto current;
@override final  HourlyDto hourly;
@override final  DailyDto daily;

/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastResponseDtoCopyWith<_ForecastResponseDto> get copyWith => __$ForecastResponseDtoCopyWithImpl<_ForecastResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastResponseDto&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.utcOffsetSeconds, utcOffsetSeconds) || other.utcOffsetSeconds == utcOffsetSeconds)&&(identical(other.current, current) || other.current == current)&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,latitude,longitude,timezone,utcOffsetSeconds,current,hourly,daily);
}

@override
String toString() {
    return 'ForecastResponseDto(latitude: $latitude, longitude: $longitude, timezone: $timezone, utcOffsetSeconds: $utcOffsetSeconds, current: $current, hourly: $hourly, daily: $daily)';
}


}

/// @nodoc
abstract mixin class _$ForecastResponseDtoCopyWith<$Res> implements $ForecastResponseDtoCopyWith<$Res> {
  factory _$ForecastResponseDtoCopyWith(_ForecastResponseDto value, $Res Function(_ForecastResponseDto) _then) = __$ForecastResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String timezone,@JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds, CurrentWeatherDto current, HourlyDto hourly, DailyDto daily
});


@override $CurrentWeatherDtoCopyWith<$Res> get current;@override $HourlyDtoCopyWith<$Res> get hourly;@override $DailyDtoCopyWith<$Res> get daily;

}
/// @nodoc
class __$ForecastResponseDtoCopyWithImpl<$Res>
    implements _$ForecastResponseDtoCopyWith<$Res> {
  __$ForecastResponseDtoCopyWithImpl(this._self, this._then);

  final _ForecastResponseDto _self;
  final $Res Function(_ForecastResponseDto) _then;

/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? timezone = null,Object? utcOffsetSeconds = freezed,Object? current = null,Object? hourly = null,Object? daily = null,}) {
  return _then(_ForecastResponseDto(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentWeatherDto,hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyDto,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyDto,
  ));
}

/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherDtoCopyWith<$Res> get current {
  
  return $CurrentWeatherDtoCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyDtoCopyWith<$Res> get hourly {
  
  return $HourlyDtoCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of ForecastResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyDtoCopyWith<$Res> get daily {
  
  return $DailyDtoCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}

// dart format on
