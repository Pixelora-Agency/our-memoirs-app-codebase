// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState()';
}


}

/// @nodoc
class $ResultStateCopyWith<$Res>  {
$ResultStateCopyWith(ResultState _, $Res Function(ResultState) __);
}


/// Adds pattern-matching-related methods to [ResultState].
extension ResultStatePatterns on ResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultState value)?  $default,{TResult Function( _Loading value)?  loading,TResult Function( _SendMail value)?  sendMail,TResult Function( _Error value)?  error,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _ResultState() when $default != null:
return $default(_that);case _SendMail() when sendMail != null:
return sendMail(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultState value)  $default,{required TResult Function( _Loading value)  loading,required TResult Function( _SendMail value)  sendMail,required TResult Function( _Error value)  error,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _ResultState():
return $default(_that);case _SendMail():
return sendMail(_that);case _Error():
return error(_that);case _Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultState value)?  $default,{TResult? Function( _Loading value)?  loading,TResult? Function( _SendMail value)?  sendMail,TResult? Function( _Error value)?  error,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _ResultState() when $default != null:
return $default(_that);case _SendMail() when sendMail != null:
return sendMail(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePaths,  String selectedAction,  bool isQrMode,  String? downloadUrl,  String? shareUrl,  int timerCountdown,  bool isLandscape)?  $default,{TResult Function()?  loading,TResult Function( String email)?  sendMail,TResult Function( String message)?  error,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _ResultState() when $default != null:
return $default(_that.imagePaths,_that.selectedAction,_that.isQrMode,_that.downloadUrl,_that.shareUrl,_that.timerCountdown,_that.isLandscape);case _SendMail() when sendMail != null:
return sendMail(_that.email);case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePaths,  String selectedAction,  bool isQrMode,  String? downloadUrl,  String? shareUrl,  int timerCountdown,  bool isLandscape)  $default,{required TResult Function()  loading,required TResult Function( String email)  sendMail,required TResult Function( String message)  error,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _ResultState():
return $default(_that.imagePaths,_that.selectedAction,_that.isQrMode,_that.downloadUrl,_that.shareUrl,_that.timerCountdown,_that.isLandscape);case _SendMail():
return sendMail(_that.email);case _Error():
return error(_that.message);case _Success():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePaths,  String selectedAction,  bool isQrMode,  String? downloadUrl,  String? shareUrl,  int timerCountdown,  bool isLandscape)?  $default,{TResult? Function()?  loading,TResult? Function( String email)?  sendMail,TResult? Function( String message)?  error,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _ResultState() when $default != null:
return $default(_that.imagePaths,_that.selectedAction,_that.isQrMode,_that.downloadUrl,_that.shareUrl,_that.timerCountdown,_that.isLandscape);case _SendMail() when sendMail != null:
return sendMail(_that.email);case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class _Loading with DiagnosticableTreeMixin implements ResultState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState.loading'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState.loading()';
}


}




/// @nodoc


class _ResultState with DiagnosticableTreeMixin implements ResultState {
  const _ResultState({required this.imagePaths, this.selectedAction = 'download', this.isQrMode = true, this.downloadUrl, this.shareUrl, this.timerCountdown = 120, this.isLandscape = false});
  

 final  String imagePaths;
@JsonKey() final  String selectedAction;
@JsonKey() final  bool isQrMode;
 final  String? downloadUrl;
 final  String? shareUrl;
@JsonKey() final  int timerCountdown;
@JsonKey() final  bool isLandscape;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultStateCopyWith<_ResultState> get copyWith => __$ResultStateCopyWithImpl<_ResultState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState'))
    ..add(DiagnosticsProperty('imagePaths', imagePaths))..add(DiagnosticsProperty('selectedAction', selectedAction))..add(DiagnosticsProperty('isQrMode', isQrMode))..add(DiagnosticsProperty('downloadUrl', downloadUrl))..add(DiagnosticsProperty('shareUrl', shareUrl))..add(DiagnosticsProperty('timerCountdown', timerCountdown))..add(DiagnosticsProperty('isLandscape', isLandscape));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultState&&(identical(other.imagePaths, imagePaths) || other.imagePaths == imagePaths)&&(identical(other.selectedAction, selectedAction) || other.selectedAction == selectedAction)&&(identical(other.isQrMode, isQrMode) || other.isQrMode == isQrMode)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.timerCountdown, timerCountdown) || other.timerCountdown == timerCountdown)&&(identical(other.isLandscape, isLandscape) || other.isLandscape == isLandscape));
}


@override
int get hashCode {
    return Object.hash(runtimeType,imagePaths,selectedAction,isQrMode,downloadUrl,shareUrl,timerCountdown,isLandscape);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState(imagePaths: $imagePaths, selectedAction: $selectedAction, isQrMode: $isQrMode, downloadUrl: $downloadUrl, shareUrl: $shareUrl, timerCountdown: $timerCountdown, isLandscape: $isLandscape)';
}


}

/// @nodoc
abstract mixin class _$ResultStateCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ResultStateCopyWith(_ResultState value, $Res Function(_ResultState) _then) = __$ResultStateCopyWithImpl;
@useResult
$Res call({
 String imagePaths, String selectedAction, bool isQrMode, String? downloadUrl, String? shareUrl, int timerCountdown, bool isLandscape
});




}
/// @nodoc
class __$ResultStateCopyWithImpl<$Res>
    implements _$ResultStateCopyWith<$Res> {
  __$ResultStateCopyWithImpl(this._self, this._then);

  final _ResultState _self;
  final $Res Function(_ResultState) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePaths = null,Object? selectedAction = null,Object? isQrMode = null,Object? downloadUrl = freezed,Object? shareUrl = freezed,Object? timerCountdown = null,Object? isLandscape = null,}) {
  return _then(_ResultState(
imagePaths: null == imagePaths ? _self.imagePaths : imagePaths // ignore: cast_nullable_to_non_nullable
as String,selectedAction: null == selectedAction ? _self.selectedAction : selectedAction // ignore: cast_nullable_to_non_nullable
as String,isQrMode: null == isQrMode ? _self.isQrMode : isQrMode // ignore: cast_nullable_to_non_nullable
as bool,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,shareUrl: freezed == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String?,timerCountdown: null == timerCountdown ? _self.timerCountdown : timerCountdown // ignore: cast_nullable_to_non_nullable
as int,isLandscape: null == isLandscape ? _self.isLandscape : isLandscape // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _SendMail with DiagnosticableTreeMixin implements ResultState {
  const _SendMail({required this.email});
  

 final  String email;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMailCopyWith<_SendMail> get copyWith => __$SendMailCopyWithImpl<_SendMail>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState.sendMail'))
    ..add(DiagnosticsProperty('email', email));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMail&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState.sendMail(email: $email)';
}


}

/// @nodoc
abstract mixin class _$SendMailCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$SendMailCopyWith(_SendMail value, $Res Function(_SendMail) _then) = __$SendMailCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$SendMailCopyWithImpl<$Res>
    implements _$SendMailCopyWith<$Res> {
  __$SendMailCopyWithImpl(this._self, this._then);

  final _SendMail _self;
  final $Res Function(_SendMail) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_SendMail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error with DiagnosticableTreeMixin implements ResultState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState.error'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success with DiagnosticableTreeMixin implements ResultState {
  const _Success();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ResultState.success'))
    ;
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ResultState.success()';
}


}




// dart format on
