// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyDto {

 List<String> get time;@JsonKey(name: 'weather_code') List<int> get weatherCodes;@JsonKey(name: 'temperature_2m_max') List<double> get maxTemperatures;@JsonKey(name: 'temperature_2m_min') List<double> get minTemperatures; List<String> get sunrise; List<String> get sunset;@JsonKey(name: 'uv_index_max') List<double> get uvIndexes;
/// Create a copy of DailyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyDtoCopyWith<DailyDto> get copyWith => _$DailyDtoCopyWithImpl<DailyDto>(this as DailyDto, _$identity);

  /// Serializes this DailyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyDto&&const DeepCollectionEquality().equals(other.time, _this.time)&&const DeepCollectionEquality().equals(other.weatherCodes, _this.weatherCodes)&&const DeepCollectionEquality().equals(other.maxTemperatures, _this.maxTemperatures)&&const DeepCollectionEquality().equals(other.minTemperatures, _this.minTemperatures)&&const DeepCollectionEquality().equals(other.sunrise, _this.sunrise)&&const DeepCollectionEquality().equals(other.sunset, _this.sunset)&&const DeepCollectionEquality().equals(other.uvIndexes, _this.uvIndexes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.time),const DeepCollectionEquality().hash(_this.weatherCodes),const DeepCollectionEquality().hash(_this.maxTemperatures),const DeepCollectionEquality().hash(_this.minTemperatures),const DeepCollectionEquality().hash(_this.sunrise),const DeepCollectionEquality().hash(_this.sunset),const DeepCollectionEquality().hash(_this.uvIndexes));
}

@override
String toString() {
  final _this = this as DailyDto;
  return 'DailyDto(time: ${_this.time}, weatherCodes: ${_this.weatherCodes}, maxTemperatures: ${_this.maxTemperatures}, minTemperatures: ${_this.minTemperatures}, sunrise: ${_this.sunrise}, sunset: ${_this.sunset}, uvIndexes: ${_this.uvIndexes})';
}


}

/// @nodoc
abstract mixin class $DailyDtoCopyWith<$Res>  {
  factory $DailyDtoCopyWith(DailyDto value, $Res Function(DailyDto) _then) = _$DailyDtoCopyWithImpl;
@useResult
$Res call({
 List<String> time,@JsonKey(name: 'weather_code') List<int> weatherCodes,@JsonKey(name: 'temperature_2m_max') List<double> maxTemperatures,@JsonKey(name: 'temperature_2m_min') List<double> minTemperatures, List<String> sunrise, List<String> sunset,@JsonKey(name: 'uv_index_max') List<double> uvIndexes
});




}
/// @nodoc
class _$DailyDtoCopyWithImpl<$Res>
    implements $DailyDtoCopyWith<$Res> {
  _$DailyDtoCopyWithImpl(this._self, this._then);

  final DailyDto _self;
  final $Res Function(DailyDto) _then;

/// Create a copy of DailyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? weatherCodes = null,Object? maxTemperatures = null,Object? minTemperatures = null,Object? sunrise = null,Object? sunset = null,Object? uvIndexes = null,}) {
  return _then(DailyDto(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>,weatherCodes: null == weatherCodes ? _self.weatherCodes : weatherCodes // ignore: cast_nullable_to_non_nullable
as List<int>,maxTemperatures: null == maxTemperatures ? _self.maxTemperatures : maxTemperatures // ignore: cast_nullable_to_non_nullable
as List<double>,minTemperatures: null == minTemperatures ? _self.minTemperatures : minTemperatures // ignore: cast_nullable_to_non_nullable
as List<double>,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>,uvIndexes: null == uvIndexes ? _self.uvIndexes : uvIndexes // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyDto].
extension DailyDtoPatterns on DailyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyDto value)  $default,){
final _that = this;
switch (_that) {
case _DailyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyDto value)?  $default,){
final _that = this;
switch (_that) {
case _DailyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> time, @JsonKey(name: 'weather_code')  List<int> weatherCodes, @JsonKey(name: 'temperature_2m_max')  List<double> maxTemperatures, @JsonKey(name: 'temperature_2m_min')  List<double> minTemperatures,  List<String> sunrise,  List<String> sunset, @JsonKey(name: 'uv_index_max')  List<double> uvIndexes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyDto() when $default != null:
return $default(_that.time,_that.weatherCodes,_that.maxTemperatures,_that.minTemperatures,_that.sunrise,_that.sunset,_that.uvIndexes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> time, @JsonKey(name: 'weather_code')  List<int> weatherCodes, @JsonKey(name: 'temperature_2m_max')  List<double> maxTemperatures, @JsonKey(name: 'temperature_2m_min')  List<double> minTemperatures,  List<String> sunrise,  List<String> sunset, @JsonKey(name: 'uv_index_max')  List<double> uvIndexes)  $default,) {final _that = this;
switch (_that) {
case _DailyDto():
return $default(_that.time,_that.weatherCodes,_that.maxTemperatures,_that.minTemperatures,_that.sunrise,_that.sunset,_that.uvIndexes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> time, @JsonKey(name: 'weather_code')  List<int> weatherCodes, @JsonKey(name: 'temperature_2m_max')  List<double> maxTemperatures, @JsonKey(name: 'temperature_2m_min')  List<double> minTemperatures,  List<String> sunrise,  List<String> sunset, @JsonKey(name: 'uv_index_max')  List<double> uvIndexes)?  $default,) {final _that = this;
switch (_that) {
case _DailyDto() when $default != null:
return $default(_that.time,_that.weatherCodes,_that.maxTemperatures,_that.minTemperatures,_that.sunrise,_that.sunset,_that.uvIndexes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyDto implements DailyDto {
  const _DailyDto({required  List<String> time, @JsonKey(name: 'weather_code') required  List<int> weatherCodes, @JsonKey(name: 'temperature_2m_max') required  List<double> maxTemperatures, @JsonKey(name: 'temperature_2m_min') required  List<double> minTemperatures, required  List<String> sunrise, required  List<String> sunset, @JsonKey(name: 'uv_index_max') required  List<double> uvIndexes}): _time = time,_weatherCodes = weatherCodes,_maxTemperatures = maxTemperatures,_minTemperatures = minTemperatures,_sunrise = sunrise,_sunset = sunset,_uvIndexes = uvIndexes;
  factory _DailyDto.fromJson(Map<String, dynamic> json) => _$DailyDtoFromJson(json);

 final  List<String> _time;
@override List<String> get time {
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_time);
}

 final  List<int> _weatherCodes;
@override@JsonKey(name: 'weather_code') List<int> get weatherCodes {
  if (_weatherCodes is EqualUnmodifiableListView) return _weatherCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weatherCodes);
}

 final  List<double> _maxTemperatures;
@override@JsonKey(name: 'temperature_2m_max') List<double> get maxTemperatures {
  if (_maxTemperatures is EqualUnmodifiableListView) return _maxTemperatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_maxTemperatures);
}

 final  List<double> _minTemperatures;
@override@JsonKey(name: 'temperature_2m_min') List<double> get minTemperatures {
  if (_minTemperatures is EqualUnmodifiableListView) return _minTemperatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_minTemperatures);
}

 final  List<String> _sunrise;
@override List<String> get sunrise {
  if (_sunrise is EqualUnmodifiableListView) return _sunrise;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sunrise);
}

 final  List<String> _sunset;
@override List<String> get sunset {
  if (_sunset is EqualUnmodifiableListView) return _sunset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sunset);
}

 final  List<double> _uvIndexes;
@override@JsonKey(name: 'uv_index_max') List<double> get uvIndexes {
  if (_uvIndexes is EqualUnmodifiableListView) return _uvIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uvIndexes);
}


/// Create a copy of DailyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyDtoCopyWith<_DailyDto> get copyWith => __$DailyDtoCopyWithImpl<_DailyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyDto&&const DeepCollectionEquality().equals(other.time, _time)&&const DeepCollectionEquality().equals(other.weatherCodes, _weatherCodes)&&const DeepCollectionEquality().equals(other.maxTemperatures, _maxTemperatures)&&const DeepCollectionEquality().equals(other.minTemperatures, _minTemperatures)&&const DeepCollectionEquality().equals(other.sunrise, _sunrise)&&const DeepCollectionEquality().equals(other.sunset, _sunset)&&const DeepCollectionEquality().equals(other.uvIndexes, _uvIndexes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_weatherCodes),const DeepCollectionEquality().hash(_maxTemperatures),const DeepCollectionEquality().hash(_minTemperatures),const DeepCollectionEquality().hash(_sunrise),const DeepCollectionEquality().hash(_sunset),const DeepCollectionEquality().hash(_uvIndexes));
}

@override
String toString() {
    return 'DailyDto(time: $time, weatherCodes: $weatherCodes, maxTemperatures: $maxTemperatures, minTemperatures: $minTemperatures, sunrise: $sunrise, sunset: $sunset, uvIndexes: $uvIndexes)';
}


}

/// @nodoc
abstract mixin class _$DailyDtoCopyWith<$Res> implements $DailyDtoCopyWith<$Res> {
  factory _$DailyDtoCopyWith(_DailyDto value, $Res Function(_DailyDto) _then) = __$DailyDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> time,@JsonKey(name: 'weather_code') List<int> weatherCodes,@JsonKey(name: 'temperature_2m_max') List<double> maxTemperatures,@JsonKey(name: 'temperature_2m_min') List<double> minTemperatures, List<String> sunrise, List<String> sunset,@JsonKey(name: 'uv_index_max') List<double> uvIndexes
});




}
/// @nodoc
class __$DailyDtoCopyWithImpl<$Res>
    implements _$DailyDtoCopyWith<$Res> {
  __$DailyDtoCopyWithImpl(this._self, this._then);

  final _DailyDto _self;
  final $Res Function(_DailyDto) _then;

/// Create a copy of DailyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? weatherCodes = null,Object? maxTemperatures = null,Object? minTemperatures = null,Object? sunrise = null,Object? sunset = null,Object? uvIndexes = null,}) {
  return _then(_DailyDto(
time: null == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<String>,weatherCodes: null == weatherCodes ? _self._weatherCodes : weatherCodes // ignore: cast_nullable_to_non_nullable
as List<int>,maxTemperatures: null == maxTemperatures ? _self._maxTemperatures : maxTemperatures // ignore: cast_nullable_to_non_nullable
as List<double>,minTemperatures: null == minTemperatures ? _self._minTemperatures : minTemperatures // ignore: cast_nullable_to_non_nullable
as List<double>,sunrise: null == sunrise ? _self._sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>,sunset: null == sunset ? _self._sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>,uvIndexes: null == uvIndexes ? _self._uvIndexes : uvIndexes // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
