// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HourlyDto {

 List<String> get time;@JsonKey(name: 'temperature_2m') List<double> get temperatures;@JsonKey(name: 'precipitation_probability') List<int> get precipitationProbabilities;@JsonKey(name: 'weather_code') List<int> get weatherCodes;
/// Create a copy of HourlyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyDtoCopyWith<HourlyDto> get copyWith => _$HourlyDtoCopyWithImpl<HourlyDto>(this as HourlyDto, _$identity);

  /// Serializes this HourlyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HourlyDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyDto&&const DeepCollectionEquality().equals(other.time, _this.time)&&const DeepCollectionEquality().equals(other.temperatures, _this.temperatures)&&const DeepCollectionEquality().equals(other.precipitationProbabilities, _this.precipitationProbabilities)&&const DeepCollectionEquality().equals(other.weatherCodes, _this.weatherCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HourlyDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.time),const DeepCollectionEquality().hash(_this.temperatures),const DeepCollectionEquality().hash(_this.precipitationProbabilities),const DeepCollectionEquality().hash(_this.weatherCodes));
}

@override
String toString() {
  final _this = this as HourlyDto;
  return 'HourlyDto(time: ${_this.time}, temperatures: ${_this.temperatures}, precipitationProbabilities: ${_this.precipitationProbabilities}, weatherCodes: ${_this.weatherCodes})';
}


}

/// @nodoc
abstract mixin class $HourlyDtoCopyWith<$Res>  {
  factory $HourlyDtoCopyWith(HourlyDto value, $Res Function(HourlyDto) _then) = _$HourlyDtoCopyWithImpl;
@useResult
$Res call({
 List<String> time,@JsonKey(name: 'temperature_2m') List<double> temperatures,@JsonKey(name: 'precipitation_probability') List<int> precipitationProbabilities,@JsonKey(name: 'weather_code') List<int> weatherCodes
});




}
/// @nodoc
class _$HourlyDtoCopyWithImpl<$Res>
    implements $HourlyDtoCopyWith<$Res> {
  _$HourlyDtoCopyWithImpl(this._self, this._then);

  final HourlyDto _self;
  final $Res Function(HourlyDto) _then;

/// Create a copy of HourlyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperatures = null,Object? precipitationProbabilities = null,Object? weatherCodes = null,}) {
  return _then(HourlyDto(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>,temperatures: null == temperatures ? _self.temperatures : temperatures // ignore: cast_nullable_to_non_nullable
as List<double>,precipitationProbabilities: null == precipitationProbabilities ? _self.precipitationProbabilities : precipitationProbabilities // ignore: cast_nullable_to_non_nullable
as List<int>,weatherCodes: null == weatherCodes ? _self.weatherCodes : weatherCodes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [HourlyDto].
extension HourlyDtoPatterns on HourlyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HourlyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HourlyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HourlyDto value)  $default,){
final _that = this;
switch (_that) {
case _HourlyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HourlyDto value)?  $default,){
final _that = this;
switch (_that) {
case _HourlyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> time, @JsonKey(name: 'temperature_2m')  List<double> temperatures, @JsonKey(name: 'precipitation_probability')  List<int> precipitationProbabilities, @JsonKey(name: 'weather_code')  List<int> weatherCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HourlyDto() when $default != null:
return $default(_that.time,_that.temperatures,_that.precipitationProbabilities,_that.weatherCodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> time, @JsonKey(name: 'temperature_2m')  List<double> temperatures, @JsonKey(name: 'precipitation_probability')  List<int> precipitationProbabilities, @JsonKey(name: 'weather_code')  List<int> weatherCodes)  $default,) {final _that = this;
switch (_that) {
case _HourlyDto():
return $default(_that.time,_that.temperatures,_that.precipitationProbabilities,_that.weatherCodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> time, @JsonKey(name: 'temperature_2m')  List<double> temperatures, @JsonKey(name: 'precipitation_probability')  List<int> precipitationProbabilities, @JsonKey(name: 'weather_code')  List<int> weatherCodes)?  $default,) {final _that = this;
switch (_that) {
case _HourlyDto() when $default != null:
return $default(_that.time,_that.temperatures,_that.precipitationProbabilities,_that.weatherCodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HourlyDto implements HourlyDto {
  const _HourlyDto({required  List<String> time, @JsonKey(name: 'temperature_2m') required  List<double> temperatures, @JsonKey(name: 'precipitation_probability') required  List<int> precipitationProbabilities, @JsonKey(name: 'weather_code') required  List<int> weatherCodes}): _time = time,_temperatures = temperatures,_precipitationProbabilities = precipitationProbabilities,_weatherCodes = weatherCodes;
  factory _HourlyDto.fromJson(Map<String, dynamic> json) => _$HourlyDtoFromJson(json);

 final  List<String> _time;
@override List<String> get time {
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_time);
}

 final  List<double> _temperatures;
@override@JsonKey(name: 'temperature_2m') List<double> get temperatures {
  if (_temperatures is EqualUnmodifiableListView) return _temperatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temperatures);
}

 final  List<int> _precipitationProbabilities;
@override@JsonKey(name: 'precipitation_probability') List<int> get precipitationProbabilities {
  if (_precipitationProbabilities is EqualUnmodifiableListView) return _precipitationProbabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_precipitationProbabilities);
}

 final  List<int> _weatherCodes;
@override@JsonKey(name: 'weather_code') List<int> get weatherCodes {
  if (_weatherCodes is EqualUnmodifiableListView) return _weatherCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weatherCodes);
}


/// Create a copy of HourlyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyDtoCopyWith<_HourlyDto> get copyWith => __$HourlyDtoCopyWithImpl<_HourlyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyDto&&const DeepCollectionEquality().equals(other.time, _time)&&const DeepCollectionEquality().equals(other.temperatures, _temperatures)&&const DeepCollectionEquality().equals(other.precipitationProbabilities, _precipitationProbabilities)&&const DeepCollectionEquality().equals(other.weatherCodes, _weatherCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_temperatures),const DeepCollectionEquality().hash(_precipitationProbabilities),const DeepCollectionEquality().hash(_weatherCodes));
}

@override
String toString() {
    return 'HourlyDto(time: $time, temperatures: $temperatures, precipitationProbabilities: $precipitationProbabilities, weatherCodes: $weatherCodes)';
}


}

/// @nodoc
abstract mixin class _$HourlyDtoCopyWith<$Res> implements $HourlyDtoCopyWith<$Res> {
  factory _$HourlyDtoCopyWith(_HourlyDto value, $Res Function(_HourlyDto) _then) = __$HourlyDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> time,@JsonKey(name: 'temperature_2m') List<double> temperatures,@JsonKey(name: 'precipitation_probability') List<int> precipitationProbabilities,@JsonKey(name: 'weather_code') List<int> weatherCodes
});




}
/// @nodoc
class __$HourlyDtoCopyWithImpl<$Res>
    implements _$HourlyDtoCopyWith<$Res> {
  __$HourlyDtoCopyWithImpl(this._self, this._then);

  final _HourlyDto _self;
  final $Res Function(_HourlyDto) _then;

/// Create a copy of HourlyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperatures = null,Object? precipitationProbabilities = null,Object? weatherCodes = null,}) {
  return _then(_HourlyDto(
time: null == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<String>,temperatures: null == temperatures ? _self._temperatures : temperatures // ignore: cast_nullable_to_non_nullable
as List<double>,precipitationProbabilities: null == precipitationProbabilities ? _self._precipitationProbabilities : precipitationProbabilities // ignore: cast_nullable_to_non_nullable
as List<int>,weatherCodes: null == weatherCodes ? _self._weatherCodes : weatherCodes // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
