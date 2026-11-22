// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceSettingState {

 List<CameraDescription> get cameras; CameraDescription? get selectedCamera; bool get isCameraReady; bool get isInitializingCamera; String? get selectedPrinter; String? get errorMessage;
/// Create a copy of DeviceSettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceSettingStateCopyWith<DeviceSettingState> get copyWith => _$DeviceSettingStateCopyWithImpl<DeviceSettingState>(this as DeviceSettingState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DeviceSettingState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceSettingState&&const DeepCollectionEquality().equals(other.cameras, _this.cameras)&&(identical(other.selectedCamera, _this.selectedCamera) || other.selectedCamera == _this.selectedCamera)&&(identical(other.isCameraReady, _this.isCameraReady) || other.isCameraReady == _this.isCameraReady)&&(identical(other.isInitializingCamera, _this.isInitializingCamera) || other.isInitializingCamera == _this.isInitializingCamera)&&(identical(other.selectedPrinter, _this.selectedPrinter) || other.selectedPrinter == _this.selectedPrinter)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as DeviceSettingState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.cameras),_this.selectedCamera,_this.isCameraReady,_this.isInitializingCamera,_this.selectedPrinter,_this.errorMessage);
}

@override
String toString() {
  final _this = this as DeviceSettingState;
  return 'DeviceSettingState(cameras: ${_this.cameras}, selectedCamera: ${_this.selectedCamera}, isCameraReady: ${_this.isCameraReady}, isInitializingCamera: ${_this.isInitializingCamera}, selectedPrinter: ${_this.selectedPrinter}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $DeviceSettingStateCopyWith<$Res>  {
  factory $DeviceSettingStateCopyWith(DeviceSettingState value, $Res Function(DeviceSettingState) _then) = _$DeviceSettingStateCopyWithImpl;
@useResult
$Res call({
 List<CameraDescription> cameras, CameraDescription? selectedCamera, bool isCameraReady, bool isInitializingCamera, String? selectedPrinter, String? errorMessage
});




}
/// @nodoc
class _$DeviceSettingStateCopyWithImpl<$Res>
    implements $DeviceSettingStateCopyWith<$Res> {
  _$DeviceSettingStateCopyWithImpl(this._self, this._then);

  final DeviceSettingState _self;
  final $Res Function(DeviceSettingState) _then;

/// Create a copy of DeviceSettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameras = null,Object? selectedCamera = freezed,Object? isCameraReady = null,Object? isInitializingCamera = null,Object? selectedPrinter = freezed,Object? errorMessage = freezed,}) {
  return _then(DeviceSettingState(
cameras: null == cameras ? _self.cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCamera: freezed == selectedCamera ? _self.selectedCamera : selectedCamera // ignore: cast_nullable_to_non_nullable
as CameraDescription?,isCameraReady: null == isCameraReady ? _self.isCameraReady : isCameraReady // ignore: cast_nullable_to_non_nullable
as bool,isInitializingCamera: null == isInitializingCamera ? _self.isInitializingCamera : isInitializingCamera // ignore: cast_nullable_to_non_nullable
as bool,selectedPrinter: freezed == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceSettingState].
extension DeviceSettingStatePatterns on DeviceSettingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceSettingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceSettingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceSettingState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceSettingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceSettingState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceSettingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CameraDescription> cameras,  CameraDescription? selectedCamera,  bool isCameraReady,  bool isInitializingCamera,  String? selectedPrinter,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceSettingState() when $default != null:
return $default(_that.cameras,_that.selectedCamera,_that.isCameraReady,_that.isInitializingCamera,_that.selectedPrinter,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CameraDescription> cameras,  CameraDescription? selectedCamera,  bool isCameraReady,  bool isInitializingCamera,  String? selectedPrinter,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DeviceSettingState():
return $default(_that.cameras,_that.selectedCamera,_that.isCameraReady,_that.isInitializingCamera,_that.selectedPrinter,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CameraDescription> cameras,  CameraDescription? selectedCamera,  bool isCameraReady,  bool isInitializingCamera,  String? selectedPrinter,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DeviceSettingState() when $default != null:
return $default(_that.cameras,_that.selectedCamera,_that.isCameraReady,_that.isInitializingCamera,_that.selectedPrinter,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceSettingState implements DeviceSettingState {
  const _DeviceSettingState({ List<CameraDescription> cameras = const [], this.selectedCamera, this.isCameraReady = false, this.isInitializingCamera = false, this.selectedPrinter, this.errorMessage}): _cameras = cameras;
  

 final  List<CameraDescription> _cameras;
@override@JsonKey() List<CameraDescription> get cameras {
  if (_cameras is EqualUnmodifiableListView) return _cameras;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cameras);
}

@override final  CameraDescription? selectedCamera;
@override@JsonKey() final  bool isCameraReady;
@override@JsonKey() final  bool isInitializingCamera;
@override final  String? selectedPrinter;
@override final  String? errorMessage;

/// Create a copy of DeviceSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceSettingStateCopyWith<_DeviceSettingState> get copyWith => __$DeviceSettingStateCopyWithImpl<_DeviceSettingState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceSettingState&&const DeepCollectionEquality().equals(other.cameras, _cameras)&&(identical(other.selectedCamera, selectedCamera) || other.selectedCamera == selectedCamera)&&(identical(other.isCameraReady, isCameraReady) || other.isCameraReady == isCameraReady)&&(identical(other.isInitializingCamera, isInitializingCamera) || other.isInitializingCamera == isInitializingCamera)&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_cameras),selectedCamera,isCameraReady,isInitializingCamera,selectedPrinter,errorMessage);
}

@override
String toString() {
    return 'DeviceSettingState(cameras: $cameras, selectedCamera: $selectedCamera, isCameraReady: $isCameraReady, isInitializingCamera: $isInitializingCamera, selectedPrinter: $selectedPrinter, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DeviceSettingStateCopyWith<$Res> implements $DeviceSettingStateCopyWith<$Res> {
  factory _$DeviceSettingStateCopyWith(_DeviceSettingState value, $Res Function(_DeviceSettingState) _then) = __$DeviceSettingStateCopyWithImpl;
@override @useResult
$Res call({
 List<CameraDescription> cameras, CameraDescription? selectedCamera, bool isCameraReady, bool isInitializingCamera, String? selectedPrinter, String? errorMessage
});




}
/// @nodoc
class __$DeviceSettingStateCopyWithImpl<$Res>
    implements _$DeviceSettingStateCopyWith<$Res> {
  __$DeviceSettingStateCopyWithImpl(this._self, this._then);

  final _DeviceSettingState _self;
  final $Res Function(_DeviceSettingState) _then;

/// Create a copy of DeviceSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameras = null,Object? selectedCamera = freezed,Object? isCameraReady = null,Object? isInitializingCamera = null,Object? selectedPrinter = freezed,Object? errorMessage = freezed,}) {
  return _then(_DeviceSettingState(
cameras: null == cameras ? _self._cameras : cameras // ignore: cast_nullable_to_non_nullable
as List<CameraDescription>,selectedCamera: freezed == selectedCamera ? _self.selectedCamera : selectedCamera // ignore: cast_nullable_to_non_nullable
as CameraDescription?,isCameraReady: null == isCameraReady ? _self.isCameraReady : isCameraReady // ignore: cast_nullable_to_non_nullable
as bool,isInitializingCamera: null == isInitializingCamera ? _self.isInitializingCamera : isInitializingCamera // ignore: cast_nullable_to_non_nullable
as bool,selectedPrinter: freezed == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
