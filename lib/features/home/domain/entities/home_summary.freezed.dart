// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyQira {

 String get id; String get surahName; String get ayahLabel; String get arabicText; String get translation; String get reciter; int get estimatedMinutes;
/// Create a copy of DailyQira
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyQiraCopyWith<DailyQira> get copyWith => _$DailyQiraCopyWithImpl<DailyQira>(this as DailyQira, _$identity);

  /// Serializes this DailyQira to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQira&&(identical(other.id, id) || other.id == id)&&(identical(other.surahName, surahName) || other.surahName == surahName)&&(identical(other.ayahLabel, ayahLabel) || other.ayahLabel == ayahLabel)&&(identical(other.arabicText, arabicText) || other.arabicText == arabicText)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.reciter, reciter) || other.reciter == reciter)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,surahName,ayahLabel,arabicText,translation,reciter,estimatedMinutes);

@override
String toString() {
  return 'DailyQira(id: $id, surahName: $surahName, ayahLabel: $ayahLabel, arabicText: $arabicText, translation: $translation, reciter: $reciter, estimatedMinutes: $estimatedMinutes)';
}


}

/// @nodoc
abstract mixin class $DailyQiraCopyWith<$Res>  {
  factory $DailyQiraCopyWith(DailyQira value, $Res Function(DailyQira) _then) = _$DailyQiraCopyWithImpl;
@useResult
$Res call({
 String id, String surahName, String ayahLabel, String arabicText, String translation, String reciter, int estimatedMinutes
});




}
/// @nodoc
class _$DailyQiraCopyWithImpl<$Res>
    implements $DailyQiraCopyWith<$Res> {
  _$DailyQiraCopyWithImpl(this._self, this._then);

  final DailyQira _self;
  final $Res Function(DailyQira) _then;

/// Create a copy of DailyQira
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? surahName = null,Object? ayahLabel = null,Object? arabicText = null,Object? translation = null,Object? reciter = null,Object? estimatedMinutes = null,}) {
  return _then(DailyQira(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,surahName: null == surahName ? _self.surahName : surahName // ignore: cast_nullable_to_non_nullable
as String,ayahLabel: null == ayahLabel ? _self.ayahLabel : ayahLabel // ignore: cast_nullable_to_non_nullable
as String,arabicText: null == arabicText ? _self.arabicText : arabicText // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,reciter: null == reciter ? _self.reciter : reciter // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyQira].
extension DailyQiraPatterns on DailyQira {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyQira value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyQira() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyQira value)  $default,){
final _that = this;
switch (_that) {
case _DailyQira():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyQira value)?  $default,){
final _that = this;
switch (_that) {
case _DailyQira() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String surahName,  String ayahLabel,  String arabicText,  String translation,  String reciter,  int estimatedMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyQira() when $default != null:
return $default(_that.id,_that.surahName,_that.ayahLabel,_that.arabicText,_that.translation,_that.reciter,_that.estimatedMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String surahName,  String ayahLabel,  String arabicText,  String translation,  String reciter,  int estimatedMinutes)  $default,) {final _that = this;
switch (_that) {
case _DailyQira():
return $default(_that.id,_that.surahName,_that.ayahLabel,_that.arabicText,_that.translation,_that.reciter,_that.estimatedMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String surahName,  String ayahLabel,  String arabicText,  String translation,  String reciter,  int estimatedMinutes)?  $default,) {final _that = this;
switch (_that) {
case _DailyQira() when $default != null:
return $default(_that.id,_that.surahName,_that.ayahLabel,_that.arabicText,_that.translation,_that.reciter,_that.estimatedMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyQira implements DailyQira {
  const _DailyQira({required this.id, required this.surahName, required this.ayahLabel, required this.arabicText, required this.translation, required this.reciter, required this.estimatedMinutes});
  factory _DailyQira.fromJson(Map<String, dynamic> json) => _$DailyQiraFromJson(json);

@override final  String id;
@override final  String surahName;
@override final  String ayahLabel;
@override final  String arabicText;
@override final  String translation;
@override final  String reciter;
@override final  int estimatedMinutes;

/// Create a copy of DailyQira
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyQiraCopyWith<_DailyQira> get copyWith => __$DailyQiraCopyWithImpl<_DailyQira>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyQiraToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyQira&&(identical(other.id, id) || other.id == id)&&(identical(other.surahName, surahName) || other.surahName == surahName)&&(identical(other.ayahLabel, ayahLabel) || other.ayahLabel == ayahLabel)&&(identical(other.arabicText, arabicText) || other.arabicText == arabicText)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.reciter, reciter) || other.reciter == reciter)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,surahName,ayahLabel,arabicText,translation,reciter,estimatedMinutes);

@override
String toString() {
  return 'DailyQira(id: $id, surahName: $surahName, ayahLabel: $ayahLabel, arabicText: $arabicText, translation: $translation, reciter: $reciter, estimatedMinutes: $estimatedMinutes)';
}


}

/// @nodoc
abstract mixin class _$DailyQiraCopyWith<$Res> implements $DailyQiraCopyWith<$Res> {
  factory _$DailyQiraCopyWith(_DailyQira value, $Res Function(_DailyQira) _then) = __$DailyQiraCopyWithImpl;
@override @useResult
$Res call({
 String id, String surahName, String ayahLabel, String arabicText, String translation, String reciter, int estimatedMinutes
});




}
/// @nodoc
class __$DailyQiraCopyWithImpl<$Res>
    implements _$DailyQiraCopyWith<$Res> {
  __$DailyQiraCopyWithImpl(this._self, this._then);

  final _DailyQira _self;
  final $Res Function(_DailyQira) _then;

/// Create a copy of DailyQira
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? surahName = null,Object? ayahLabel = null,Object? arabicText = null,Object? translation = null,Object? reciter = null,Object? estimatedMinutes = null,}) {
  return _then(_DailyQira(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,surahName: null == surahName ? _self.surahName : surahName // ignore: cast_nullable_to_non_nullable
as String,ayahLabel: null == ayahLabel ? _self.ayahLabel : ayahLabel // ignore: cast_nullable_to_non_nullable
as String,arabicText: null == arabicText ? _self.arabicText : arabicText // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,reciter: null == reciter ? _self.reciter : reciter // ignore: cast_nullable_to_non_nullable
as String,estimatedMinutes: null == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AiGreeting {

 String get headline; String get message;
/// Create a copy of AiGreeting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiGreetingCopyWith<AiGreeting> get copyWith => _$AiGreetingCopyWithImpl<AiGreeting>(this as AiGreeting, _$identity);

  /// Serializes this AiGreeting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiGreeting&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,message);

@override
String toString() {
  return 'AiGreeting(headline: $headline, message: $message)';
}


}

/// @nodoc
abstract mixin class $AiGreetingCopyWith<$Res>  {
  factory $AiGreetingCopyWith(AiGreeting value, $Res Function(AiGreeting) _then) = _$AiGreetingCopyWithImpl;
@useResult
$Res call({
 String headline, String message
});




}
/// @nodoc
class _$AiGreetingCopyWithImpl<$Res>
    implements $AiGreetingCopyWith<$Res> {
  _$AiGreetingCopyWithImpl(this._self, this._then);

  final AiGreeting _self;
  final $Res Function(AiGreeting) _then;

/// Create a copy of AiGreeting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? headline = null,Object? message = null,}) {
  return _then(AiGreeting(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiGreeting].
extension AiGreetingPatterns on AiGreeting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiGreeting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiGreeting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiGreeting value)  $default,){
final _that = this;
switch (_that) {
case _AiGreeting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiGreeting value)?  $default,){
final _that = this;
switch (_that) {
case _AiGreeting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String headline,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiGreeting() when $default != null:
return $default(_that.headline,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String headline,  String message)  $default,) {final _that = this;
switch (_that) {
case _AiGreeting():
return $default(_that.headline,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String headline,  String message)?  $default,) {final _that = this;
switch (_that) {
case _AiGreeting() when $default != null:
return $default(_that.headline,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiGreeting implements AiGreeting {
  const _AiGreeting({required this.headline, required this.message});
  factory _AiGreeting.fromJson(Map<String, dynamic> json) => _$AiGreetingFromJson(json);

@override final  String headline;
@override final  String message;

/// Create a copy of AiGreeting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiGreetingCopyWith<_AiGreeting> get copyWith => __$AiGreetingCopyWithImpl<_AiGreeting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiGreetingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiGreeting&&(identical(other.headline, headline) || other.headline == headline)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,headline,message);

@override
String toString() {
  return 'AiGreeting(headline: $headline, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AiGreetingCopyWith<$Res> implements $AiGreetingCopyWith<$Res> {
  factory _$AiGreetingCopyWith(_AiGreeting value, $Res Function(_AiGreeting) _then) = __$AiGreetingCopyWithImpl;
@override @useResult
$Res call({
 String headline, String message
});




}
/// @nodoc
class __$AiGreetingCopyWithImpl<$Res>
    implements _$AiGreetingCopyWith<$Res> {
  __$AiGreetingCopyWithImpl(this._self, this._then);

  final _AiGreeting _self;
  final $Res Function(_AiGreeting) _then;

/// Create a copy of AiGreeting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? headline = null,Object? message = null,}) {
  return _then(_AiGreeting(
headline: null == headline ? _self.headline : headline // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WeeklySnapshot {

 int get sessionsDone; int get sessionsTarget; int get averageMatch; int get streakDays;
/// Create a copy of WeeklySnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklySnapshotCopyWith<WeeklySnapshot> get copyWith => _$WeeklySnapshotCopyWithImpl<WeeklySnapshot>(this as WeeklySnapshot, _$identity);

  /// Serializes this WeeklySnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklySnapshot&&(identical(other.sessionsDone, sessionsDone) || other.sessionsDone == sessionsDone)&&(identical(other.sessionsTarget, sessionsTarget) || other.sessionsTarget == sessionsTarget)&&(identical(other.averageMatch, averageMatch) || other.averageMatch == averageMatch)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionsDone,sessionsTarget,averageMatch,streakDays);

@override
String toString() {
  return 'WeeklySnapshot(sessionsDone: $sessionsDone, sessionsTarget: $sessionsTarget, averageMatch: $averageMatch, streakDays: $streakDays)';
}


}

/// @nodoc
abstract mixin class $WeeklySnapshotCopyWith<$Res>  {
  factory $WeeklySnapshotCopyWith(WeeklySnapshot value, $Res Function(WeeklySnapshot) _then) = _$WeeklySnapshotCopyWithImpl;
@useResult
$Res call({
 int sessionsDone, int sessionsTarget, int averageMatch, int streakDays
});




}
/// @nodoc
class _$WeeklySnapshotCopyWithImpl<$Res>
    implements $WeeklySnapshotCopyWith<$Res> {
  _$WeeklySnapshotCopyWithImpl(this._self, this._then);

  final WeeklySnapshot _self;
  final $Res Function(WeeklySnapshot) _then;

/// Create a copy of WeeklySnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionsDone = null,Object? sessionsTarget = null,Object? averageMatch = null,Object? streakDays = null,}) {
  return _then(WeeklySnapshot(
sessionsDone: null == sessionsDone ? _self.sessionsDone : sessionsDone // ignore: cast_nullable_to_non_nullable
as int,sessionsTarget: null == sessionsTarget ? _self.sessionsTarget : sessionsTarget // ignore: cast_nullable_to_non_nullable
as int,averageMatch: null == averageMatch ? _self.averageMatch : averageMatch // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklySnapshot].
extension WeeklySnapshotPatterns on WeeklySnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklySnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklySnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklySnapshot value)  $default,){
final _that = this;
switch (_that) {
case _WeeklySnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklySnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklySnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessionsDone,  int sessionsTarget,  int averageMatch,  int streakDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklySnapshot() when $default != null:
return $default(_that.sessionsDone,_that.sessionsTarget,_that.averageMatch,_that.streakDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessionsDone,  int sessionsTarget,  int averageMatch,  int streakDays)  $default,) {final _that = this;
switch (_that) {
case _WeeklySnapshot():
return $default(_that.sessionsDone,_that.sessionsTarget,_that.averageMatch,_that.streakDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessionsDone,  int sessionsTarget,  int averageMatch,  int streakDays)?  $default,) {final _that = this;
switch (_that) {
case _WeeklySnapshot() when $default != null:
return $default(_that.sessionsDone,_that.sessionsTarget,_that.averageMatch,_that.streakDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklySnapshot implements WeeklySnapshot {
  const _WeeklySnapshot({required this.sessionsDone, required this.sessionsTarget, required this.averageMatch, required this.streakDays});
  factory _WeeklySnapshot.fromJson(Map<String, dynamic> json) => _$WeeklySnapshotFromJson(json);

@override final  int sessionsDone;
@override final  int sessionsTarget;
@override final  int averageMatch;
@override final  int streakDays;

/// Create a copy of WeeklySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklySnapshotCopyWith<_WeeklySnapshot> get copyWith => __$WeeklySnapshotCopyWithImpl<_WeeklySnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklySnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklySnapshot&&(identical(other.sessionsDone, sessionsDone) || other.sessionsDone == sessionsDone)&&(identical(other.sessionsTarget, sessionsTarget) || other.sessionsTarget == sessionsTarget)&&(identical(other.averageMatch, averageMatch) || other.averageMatch == averageMatch)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionsDone,sessionsTarget,averageMatch,streakDays);

@override
String toString() {
  return 'WeeklySnapshot(sessionsDone: $sessionsDone, sessionsTarget: $sessionsTarget, averageMatch: $averageMatch, streakDays: $streakDays)';
}


}

/// @nodoc
abstract mixin class _$WeeklySnapshotCopyWith<$Res> implements $WeeklySnapshotCopyWith<$Res> {
  factory _$WeeklySnapshotCopyWith(_WeeklySnapshot value, $Res Function(_WeeklySnapshot) _then) = __$WeeklySnapshotCopyWithImpl;
@override @useResult
$Res call({
 int sessionsDone, int sessionsTarget, int averageMatch, int streakDays
});




}
/// @nodoc
class __$WeeklySnapshotCopyWithImpl<$Res>
    implements _$WeeklySnapshotCopyWith<$Res> {
  __$WeeklySnapshotCopyWithImpl(this._self, this._then);

  final _WeeklySnapshot _self;
  final $Res Function(_WeeklySnapshot) _then;

/// Create a copy of WeeklySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionsDone = null,Object? sessionsTarget = null,Object? averageMatch = null,Object? streakDays = null,}) {
  return _then(_WeeklySnapshot(
sessionsDone: null == sessionsDone ? _self.sessionsDone : sessionsDone // ignore: cast_nullable_to_non_nullable
as int,sessionsTarget: null == sessionsTarget ? _self.sessionsTarget : sessionsTarget // ignore: cast_nullable_to_non_nullable
as int,averageMatch: null == averageMatch ? _self.averageMatch : averageMatch // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ContinuePractice {

 String get practiceId; String get surahName; String get ayahLabel; int get lastMatch;
/// Create a copy of ContinuePractice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinuePracticeCopyWith<ContinuePractice> get copyWith => _$ContinuePracticeCopyWithImpl<ContinuePractice>(this as ContinuePractice, _$identity);

  /// Serializes this ContinuePractice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinuePractice&&(identical(other.practiceId, practiceId) || other.practiceId == practiceId)&&(identical(other.surahName, surahName) || other.surahName == surahName)&&(identical(other.ayahLabel, ayahLabel) || other.ayahLabel == ayahLabel)&&(identical(other.lastMatch, lastMatch) || other.lastMatch == lastMatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,practiceId,surahName,ayahLabel,lastMatch);

@override
String toString() {
  return 'ContinuePractice(practiceId: $practiceId, surahName: $surahName, ayahLabel: $ayahLabel, lastMatch: $lastMatch)';
}


}

/// @nodoc
abstract mixin class $ContinuePracticeCopyWith<$Res>  {
  factory $ContinuePracticeCopyWith(ContinuePractice value, $Res Function(ContinuePractice) _then) = _$ContinuePracticeCopyWithImpl;
@useResult
$Res call({
 String practiceId, String surahName, String ayahLabel, int lastMatch
});




}
/// @nodoc
class _$ContinuePracticeCopyWithImpl<$Res>
    implements $ContinuePracticeCopyWith<$Res> {
  _$ContinuePracticeCopyWithImpl(this._self, this._then);

  final ContinuePractice _self;
  final $Res Function(ContinuePractice) _then;

/// Create a copy of ContinuePractice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? practiceId = null,Object? surahName = null,Object? ayahLabel = null,Object? lastMatch = null,}) {
  return _then(ContinuePractice(
practiceId: null == practiceId ? _self.practiceId : practiceId // ignore: cast_nullable_to_non_nullable
as String,surahName: null == surahName ? _self.surahName : surahName // ignore: cast_nullable_to_non_nullable
as String,ayahLabel: null == ayahLabel ? _self.ayahLabel : ayahLabel // ignore: cast_nullable_to_non_nullable
as String,lastMatch: null == lastMatch ? _self.lastMatch : lastMatch // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ContinuePractice].
extension ContinuePracticePatterns on ContinuePractice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContinuePractice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContinuePractice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContinuePractice value)  $default,){
final _that = this;
switch (_that) {
case _ContinuePractice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContinuePractice value)?  $default,){
final _that = this;
switch (_that) {
case _ContinuePractice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String practiceId,  String surahName,  String ayahLabel,  int lastMatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContinuePractice() when $default != null:
return $default(_that.practiceId,_that.surahName,_that.ayahLabel,_that.lastMatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String practiceId,  String surahName,  String ayahLabel,  int lastMatch)  $default,) {final _that = this;
switch (_that) {
case _ContinuePractice():
return $default(_that.practiceId,_that.surahName,_that.ayahLabel,_that.lastMatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String practiceId,  String surahName,  String ayahLabel,  int lastMatch)?  $default,) {final _that = this;
switch (_that) {
case _ContinuePractice() when $default != null:
return $default(_that.practiceId,_that.surahName,_that.ayahLabel,_that.lastMatch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContinuePractice implements ContinuePractice {
  const _ContinuePractice({required this.practiceId, required this.surahName, required this.ayahLabel, required this.lastMatch});
  factory _ContinuePractice.fromJson(Map<String, dynamic> json) => _$ContinuePracticeFromJson(json);

@override final  String practiceId;
@override final  String surahName;
@override final  String ayahLabel;
@override final  int lastMatch;

/// Create a copy of ContinuePractice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContinuePracticeCopyWith<_ContinuePractice> get copyWith => __$ContinuePracticeCopyWithImpl<_ContinuePractice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContinuePracticeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContinuePractice&&(identical(other.practiceId, practiceId) || other.practiceId == practiceId)&&(identical(other.surahName, surahName) || other.surahName == surahName)&&(identical(other.ayahLabel, ayahLabel) || other.ayahLabel == ayahLabel)&&(identical(other.lastMatch, lastMatch) || other.lastMatch == lastMatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,practiceId,surahName,ayahLabel,lastMatch);

@override
String toString() {
  return 'ContinuePractice(practiceId: $practiceId, surahName: $surahName, ayahLabel: $ayahLabel, lastMatch: $lastMatch)';
}


}

/// @nodoc
abstract mixin class _$ContinuePracticeCopyWith<$Res> implements $ContinuePracticeCopyWith<$Res> {
  factory _$ContinuePracticeCopyWith(_ContinuePractice value, $Res Function(_ContinuePractice) _then) = __$ContinuePracticeCopyWithImpl;
@override @useResult
$Res call({
 String practiceId, String surahName, String ayahLabel, int lastMatch
});




}
/// @nodoc
class __$ContinuePracticeCopyWithImpl<$Res>
    implements _$ContinuePracticeCopyWith<$Res> {
  __$ContinuePracticeCopyWithImpl(this._self, this._then);

  final _ContinuePractice _self;
  final $Res Function(_ContinuePractice) _then;

/// Create a copy of ContinuePractice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? practiceId = null,Object? surahName = null,Object? ayahLabel = null,Object? lastMatch = null,}) {
  return _then(_ContinuePractice(
practiceId: null == practiceId ? _self.practiceId : practiceId // ignore: cast_nullable_to_non_nullable
as String,surahName: null == surahName ? _self.surahName : surahName // ignore: cast_nullable_to_non_nullable
as String,ayahLabel: null == ayahLabel ? _self.ayahLabel : ayahLabel // ignore: cast_nullable_to_non_nullable
as String,lastMatch: null == lastMatch ? _self.lastMatch : lastMatch // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AiRecommendation {

 String get practiceId; String get title; String get reason;
/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiRecommendationCopyWith<AiRecommendation> get copyWith => _$AiRecommendationCopyWithImpl<AiRecommendation>(this as AiRecommendation, _$identity);

  /// Serializes this AiRecommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiRecommendation&&(identical(other.practiceId, practiceId) || other.practiceId == practiceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,practiceId,title,reason);

@override
String toString() {
  return 'AiRecommendation(practiceId: $practiceId, title: $title, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $AiRecommendationCopyWith<$Res>  {
  factory $AiRecommendationCopyWith(AiRecommendation value, $Res Function(AiRecommendation) _then) = _$AiRecommendationCopyWithImpl;
@useResult
$Res call({
 String practiceId, String title, String reason
});




}
/// @nodoc
class _$AiRecommendationCopyWithImpl<$Res>
    implements $AiRecommendationCopyWith<$Res> {
  _$AiRecommendationCopyWithImpl(this._self, this._then);

  final AiRecommendation _self;
  final $Res Function(AiRecommendation) _then;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? practiceId = null,Object? title = null,Object? reason = null,}) {
  return _then(AiRecommendation(
practiceId: null == practiceId ? _self.practiceId : practiceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiRecommendation].
extension AiRecommendationPatterns on AiRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _AiRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String practiceId,  String title,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
return $default(_that.practiceId,_that.title,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String practiceId,  String title,  String reason)  $default,) {final _that = this;
switch (_that) {
case _AiRecommendation():
return $default(_that.practiceId,_that.title,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String practiceId,  String title,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
return $default(_that.practiceId,_that.title,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiRecommendation implements AiRecommendation {
  const _AiRecommendation({required this.practiceId, required this.title, required this.reason});
  factory _AiRecommendation.fromJson(Map<String, dynamic> json) => _$AiRecommendationFromJson(json);

@override final  String practiceId;
@override final  String title;
@override final  String reason;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiRecommendationCopyWith<_AiRecommendation> get copyWith => __$AiRecommendationCopyWithImpl<_AiRecommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiRecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiRecommendation&&(identical(other.practiceId, practiceId) || other.practiceId == practiceId)&&(identical(other.title, title) || other.title == title)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,practiceId,title,reason);

@override
String toString() {
  return 'AiRecommendation(practiceId: $practiceId, title: $title, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$AiRecommendationCopyWith<$Res> implements $AiRecommendationCopyWith<$Res> {
  factory _$AiRecommendationCopyWith(_AiRecommendation value, $Res Function(_AiRecommendation) _then) = __$AiRecommendationCopyWithImpl;
@override @useResult
$Res call({
 String practiceId, String title, String reason
});




}
/// @nodoc
class __$AiRecommendationCopyWithImpl<$Res>
    implements _$AiRecommendationCopyWith<$Res> {
  __$AiRecommendationCopyWithImpl(this._self, this._then);

  final _AiRecommendation _self;
  final $Res Function(_AiRecommendation) _then;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? practiceId = null,Object? title = null,Object? reason = null,}) {
  return _then(_AiRecommendation(
practiceId: null == practiceId ? _self.practiceId : practiceId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeSummary {

 DailyQira get dailyQira; AiGreeting get greeting; WeeklySnapshot get weeklySnapshot; ContinuePractice? get continuePractice; AiRecommendation? get recommendation;
/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSummaryCopyWith<HomeSummary> get copyWith => _$HomeSummaryCopyWithImpl<HomeSummary>(this as HomeSummary, _$identity);

  /// Serializes this HomeSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSummary&&(identical(other.dailyQira, dailyQira) || other.dailyQira == dailyQira)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&(identical(other.weeklySnapshot, weeklySnapshot) || other.weeklySnapshot == weeklySnapshot)&&(identical(other.continuePractice, continuePractice) || other.continuePractice == continuePractice)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyQira,greeting,weeklySnapshot,continuePractice,recommendation);

@override
String toString() {
  return 'HomeSummary(dailyQira: $dailyQira, greeting: $greeting, weeklySnapshot: $weeklySnapshot, continuePractice: $continuePractice, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class $HomeSummaryCopyWith<$Res>  {
  factory $HomeSummaryCopyWith(HomeSummary value, $Res Function(HomeSummary) _then) = _$HomeSummaryCopyWithImpl;
@useResult
$Res call({
 DailyQira dailyQira, AiGreeting greeting, WeeklySnapshot weeklySnapshot, ContinuePractice? continuePractice, AiRecommendation? recommendation
});


$DailyQiraCopyWith<$Res> get dailyQira;$AiGreetingCopyWith<$Res> get greeting;$WeeklySnapshotCopyWith<$Res> get weeklySnapshot;$ContinuePracticeCopyWith<$Res>? get continuePractice;$AiRecommendationCopyWith<$Res>? get recommendation;

}
/// @nodoc
class _$HomeSummaryCopyWithImpl<$Res>
    implements $HomeSummaryCopyWith<$Res> {
  _$HomeSummaryCopyWithImpl(this._self, this._then);

  final HomeSummary _self;
  final $Res Function(HomeSummary) _then;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyQira = null,Object? greeting = null,Object? weeklySnapshot = null,Object? continuePractice = freezed,Object? recommendation = freezed,}) {
  return _then(HomeSummary(
dailyQira: null == dailyQira ? _self.dailyQira : dailyQira // ignore: cast_nullable_to_non_nullable
as DailyQira,greeting: null == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as AiGreeting,weeklySnapshot: null == weeklySnapshot ? _self.weeklySnapshot : weeklySnapshot // ignore: cast_nullable_to_non_nullable
as WeeklySnapshot,continuePractice: freezed == continuePractice ? _self.continuePractice : continuePractice // ignore: cast_nullable_to_non_nullable
as ContinuePractice?,recommendation: freezed == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as AiRecommendation?,
  ));
}
/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyQiraCopyWith<$Res> get dailyQira {
  
  return $DailyQiraCopyWith<$Res>(_self.dailyQira, (value) {
    return _then(_self.copyWith(dailyQira: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiGreetingCopyWith<$Res> get greeting {
  
  return $AiGreetingCopyWith<$Res>(_self.greeting, (value) {
    return _then(_self.copyWith(greeting: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklySnapshotCopyWith<$Res> get weeklySnapshot {
  
  return $WeeklySnapshotCopyWith<$Res>(_self.weeklySnapshot, (value) {
    return _then(_self.copyWith(weeklySnapshot: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContinuePracticeCopyWith<$Res>? get continuePractice {
    if (_self.continuePractice == null) {
    return null;
  }

  return $ContinuePracticeCopyWith<$Res>(_self.continuePractice!, (value) {
    return _then(_self.copyWith(continuePractice: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiRecommendationCopyWith<$Res>? get recommendation {
    if (_self.recommendation == null) {
    return null;
  }

  return $AiRecommendationCopyWith<$Res>(_self.recommendation!, (value) {
    return _then(_self.copyWith(recommendation: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeSummary].
extension HomeSummaryPatterns on HomeSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSummary value)  $default,){
final _that = this;
switch (_that) {
case _HomeSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DailyQira dailyQira,  AiGreeting greeting,  WeeklySnapshot weeklySnapshot,  ContinuePractice? continuePractice,  AiRecommendation? recommendation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
return $default(_that.dailyQira,_that.greeting,_that.weeklySnapshot,_that.continuePractice,_that.recommendation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DailyQira dailyQira,  AiGreeting greeting,  WeeklySnapshot weeklySnapshot,  ContinuePractice? continuePractice,  AiRecommendation? recommendation)  $default,) {final _that = this;
switch (_that) {
case _HomeSummary():
return $default(_that.dailyQira,_that.greeting,_that.weeklySnapshot,_that.continuePractice,_that.recommendation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DailyQira dailyQira,  AiGreeting greeting,  WeeklySnapshot weeklySnapshot,  ContinuePractice? continuePractice,  AiRecommendation? recommendation)?  $default,) {final _that = this;
switch (_that) {
case _HomeSummary() when $default != null:
return $default(_that.dailyQira,_that.greeting,_that.weeklySnapshot,_that.continuePractice,_that.recommendation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSummary implements HomeSummary {
  const _HomeSummary({required this.dailyQira, required this.greeting, required this.weeklySnapshot, this.continuePractice, this.recommendation});
  factory _HomeSummary.fromJson(Map<String, dynamic> json) => _$HomeSummaryFromJson(json);

@override final  DailyQira dailyQira;
@override final  AiGreeting greeting;
@override final  WeeklySnapshot weeklySnapshot;
@override final  ContinuePractice? continuePractice;
@override final  AiRecommendation? recommendation;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSummaryCopyWith<_HomeSummary> get copyWith => __$HomeSummaryCopyWithImpl<_HomeSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSummary&&(identical(other.dailyQira, dailyQira) || other.dailyQira == dailyQira)&&(identical(other.greeting, greeting) || other.greeting == greeting)&&(identical(other.weeklySnapshot, weeklySnapshot) || other.weeklySnapshot == weeklySnapshot)&&(identical(other.continuePractice, continuePractice) || other.continuePractice == continuePractice)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyQira,greeting,weeklySnapshot,continuePractice,recommendation);

@override
String toString() {
  return 'HomeSummary(dailyQira: $dailyQira, greeting: $greeting, weeklySnapshot: $weeklySnapshot, continuePractice: $continuePractice, recommendation: $recommendation)';
}


}

/// @nodoc
abstract mixin class _$HomeSummaryCopyWith<$Res> implements $HomeSummaryCopyWith<$Res> {
  factory _$HomeSummaryCopyWith(_HomeSummary value, $Res Function(_HomeSummary) _then) = __$HomeSummaryCopyWithImpl;
@override @useResult
$Res call({
 DailyQira dailyQira, AiGreeting greeting, WeeklySnapshot weeklySnapshot, ContinuePractice? continuePractice, AiRecommendation? recommendation
});


@override $DailyQiraCopyWith<$Res> get dailyQira;@override $AiGreetingCopyWith<$Res> get greeting;@override $WeeklySnapshotCopyWith<$Res> get weeklySnapshot;@override $ContinuePracticeCopyWith<$Res>? get continuePractice;@override $AiRecommendationCopyWith<$Res>? get recommendation;

}
/// @nodoc
class __$HomeSummaryCopyWithImpl<$Res>
    implements _$HomeSummaryCopyWith<$Res> {
  __$HomeSummaryCopyWithImpl(this._self, this._then);

  final _HomeSummary _self;
  final $Res Function(_HomeSummary) _then;

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyQira = null,Object? greeting = null,Object? weeklySnapshot = null,Object? continuePractice = freezed,Object? recommendation = freezed,}) {
  return _then(_HomeSummary(
dailyQira: null == dailyQira ? _self.dailyQira : dailyQira // ignore: cast_nullable_to_non_nullable
as DailyQira,greeting: null == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as AiGreeting,weeklySnapshot: null == weeklySnapshot ? _self.weeklySnapshot : weeklySnapshot // ignore: cast_nullable_to_non_nullable
as WeeklySnapshot,continuePractice: freezed == continuePractice ? _self.continuePractice : continuePractice // ignore: cast_nullable_to_non_nullable
as ContinuePractice?,recommendation: freezed == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as AiRecommendation?,
  ));
}

/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyQiraCopyWith<$Res> get dailyQira {
  
  return $DailyQiraCopyWith<$Res>(_self.dailyQira, (value) {
    return _then(_self.copyWith(dailyQira: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiGreetingCopyWith<$Res> get greeting {
  
  return $AiGreetingCopyWith<$Res>(_self.greeting, (value) {
    return _then(_self.copyWith(greeting: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklySnapshotCopyWith<$Res> get weeklySnapshot {
  
  return $WeeklySnapshotCopyWith<$Res>(_self.weeklySnapshot, (value) {
    return _then(_self.copyWith(weeklySnapshot: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContinuePracticeCopyWith<$Res>? get continuePractice {
    if (_self.continuePractice == null) {
    return null;
  }

  return $ContinuePracticeCopyWith<$Res>(_self.continuePractice!, (value) {
    return _then(_self.copyWith(continuePractice: value));
  });
}/// Create a copy of HomeSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AiRecommendationCopyWith<$Res>? get recommendation {
    if (_self.recommendation == null) {
    return null;
  }

  return $AiRecommendationCopyWith<$Res>(_self.recommendation!, (value) {
    return _then(_self.copyWith(recommendation: value));
  });
}
}

// dart format on
