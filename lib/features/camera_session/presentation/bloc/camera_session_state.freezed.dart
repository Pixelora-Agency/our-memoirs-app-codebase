// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraSessionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CameraSessionState()';
}


}

/// @nodoc
class $CameraSessionStateCopyWith<$Res>  {
$CameraSessionStateCopyWith(CameraSessionState _, $Res Function(CameraSessionState) __);
}


/// Adds pattern-matching-related methods to [CameraSessionState].
extension CameraSessionStatePatterns on CameraSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,TResult Function( _Review value)?  review,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Review() when review != null:
return review(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,required TResult Function( _Review value)  review,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);case _Review():
return review(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,TResult? Function( _Review value)?  review,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _Review() when review != null:
return review(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int prepareSeconds,  CameraController? controller)?  initial,TResult Function()?  loading,TResult Function( CameraController controller,  String cameraName,  FrameModel frameConfig,  int slotCountdown,  int currentSlotIndex,  int totalSlots,  List<XFile?> capturedPhotos,  bool isTakingPicture)?  ready,TResult Function( CameraController controller,  FrameModel frameConfig,  List<XFile?> capturedPhotos,  int? selectedIndexToRetake)?  review,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.prepareSeconds,_that.controller);case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.controller,_that.cameraName,_that.frameConfig,_that.slotCountdown,_that.currentSlotIndex,_that.totalSlots,_that.capturedPhotos,_that.isTakingPicture);case _Review() when review != null:
return review(_that.controller,_that.frameConfig,_that.capturedPhotos,_that.selectedIndexToRetake);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int prepareSeconds,  CameraController? controller)  initial,required TResult Function()  loading,required TResult Function( CameraController controller,  String cameraName,  FrameModel frameConfig,  int slotCountdown,  int currentSlotIndex,  int totalSlots,  List<XFile?> capturedPhotos,  bool isTakingPicture)  ready,required TResult Function( CameraController controller,  FrameModel frameConfig,  List<XFile?> capturedPhotos,  int? selectedIndexToRetake)  review,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.prepareSeconds,_that.controller);case _Loading():
return loading();case _Ready():
return ready(_that.controller,_that.cameraName,_that.frameConfig,_that.slotCountdown,_that.currentSlotIndex,_that.totalSlots,_that.capturedPhotos,_that.isTakingPicture);case _Review():
return review(_that.controller,_that.frameConfig,_that.capturedPhotos,_that.selectedIndexToRetake);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int prepareSeconds,  CameraController? controller)?  initial,TResult? Function()?  loading,TResult? Function( CameraController controller,  String cameraName,  FrameModel frameConfig,  int slotCountdown,  int currentSlotIndex,  int totalSlots,  List<XFile?> capturedPhotos,  bool isTakingPicture)?  ready,TResult? Function( CameraController controller,  FrameModel frameConfig,  List<XFile?> capturedPhotos,  int? selectedIndexToRetake)?  review,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.prepareSeconds,_that.controller);case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.controller,_that.cameraName,_that.frameConfig,_that.slotCountdown,_that.currentSlotIndex,_that.totalSlots,_that.capturedPhotos,_that.isTakingPicture);case _Review() when review != null:
return review(_that.controller,_that.frameConfig,_that.capturedPhotos,_that.selectedIndexToRetake);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CameraSessionState {
  const _Initial({this.prepareSeconds = 10, this.controller});
  

@JsonKey() final  int prepareSeconds;
 final  CameraController? controller;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.prepareSeconds, prepareSeconds) || other.prepareSeconds == prepareSeconds)&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode {
    return Object.hash(runtimeType,prepareSeconds,controller);
}

@override
String toString() {
    return 'CameraSessionState.initial(prepareSeconds: $prepareSeconds, controller: $controller)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CameraSessionStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@useResult
$Res call({
 int prepareSeconds, CameraController? controller
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prepareSeconds = null,Object? controller = freezed,}) {
  return _then(_Initial(
prepareSeconds: null == prepareSeconds ? _self.prepareSeconds : prepareSeconds // ignore: cast_nullable_to_non_nullable
as int,controller: freezed == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController?,
  ));
}


}

/// @nodoc


class _Loading implements CameraSessionState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CameraSessionState.loading()';
}


}




/// @nodoc


class _Ready implements CameraSessionState {
  const _Ready({required this.controller, required this.cameraName, required this.frameConfig, this.slotCountdown = 3, this.currentSlotIndex = 0, required this.totalSlots,  List<XFile?> capturedPhotos = const [], this.isTakingPicture = false}): _capturedPhotos = capturedPhotos;
  

 final  CameraController controller;
 final  String cameraName;
 final  FrameModel frameConfig;
@JsonKey() final  int slotCountdown;
@JsonKey() final  int currentSlotIndex;
 final  int totalSlots;
 final  List<XFile?> _capturedPhotos;
@JsonKey() List<XFile?> get capturedPhotos {
  if (_capturedPhotos is EqualUnmodifiableListView) return _capturedPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capturedPhotos);
}

@JsonKey() final  bool isTakingPicture;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.cameraName, cameraName) || other.cameraName == cameraName)&&(identical(other.frameConfig, frameConfig) || other.frameConfig == frameConfig)&&(identical(other.slotCountdown, slotCountdown) || other.slotCountdown == slotCountdown)&&(identical(other.currentSlotIndex, currentSlotIndex) || other.currentSlotIndex == currentSlotIndex)&&(identical(other.totalSlots, totalSlots) || other.totalSlots == totalSlots)&&const DeepCollectionEquality().equals(other.capturedPhotos, _capturedPhotos)&&(identical(other.isTakingPicture, isTakingPicture) || other.isTakingPicture == isTakingPicture));
}


@override
int get hashCode {
    return Object.hash(runtimeType,controller,cameraName,frameConfig,slotCountdown,currentSlotIndex,totalSlots,const DeepCollectionEquality().hash(_capturedPhotos),isTakingPicture);
}

@override
String toString() {
    return 'CameraSessionState.ready(controller: $controller, cameraName: $cameraName, frameConfig: $frameConfig, slotCountdown: $slotCountdown, currentSlotIndex: $currentSlotIndex, totalSlots: $totalSlots, capturedPhotos: $capturedPhotos, isTakingPicture: $isTakingPicture)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $CameraSessionStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 CameraController controller, String cameraName, FrameModel frameConfig, int slotCountdown, int currentSlotIndex, int totalSlots, List<XFile?> capturedPhotos, bool isTakingPicture
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,Object? cameraName = null,Object? frameConfig = null,Object? slotCountdown = null,Object? currentSlotIndex = null,Object? totalSlots = null,Object? capturedPhotos = null,Object? isTakingPicture = null,}) {
  return _then(_Ready(
controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController,cameraName: null == cameraName ? _self.cameraName : cameraName // ignore: cast_nullable_to_non_nullable
as String,frameConfig: null == frameConfig ? _self.frameConfig : frameConfig // ignore: cast_nullable_to_non_nullable
as FrameModel,slotCountdown: null == slotCountdown ? _self.slotCountdown : slotCountdown // ignore: cast_nullable_to_non_nullable
as int,currentSlotIndex: null == currentSlotIndex ? _self.currentSlotIndex : currentSlotIndex // ignore: cast_nullable_to_non_nullable
as int,totalSlots: null == totalSlots ? _self.totalSlots : totalSlots // ignore: cast_nullable_to_non_nullable
as int,capturedPhotos: null == capturedPhotos ? _self._capturedPhotos : capturedPhotos // ignore: cast_nullable_to_non_nullable
as List<XFile?>,isTakingPicture: null == isTakingPicture ? _self.isTakingPicture : isTakingPicture // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Review implements CameraSessionState {
  const _Review({required this.controller, required this.frameConfig, required  List<XFile?> capturedPhotos, this.selectedIndexToRetake}): _capturedPhotos = capturedPhotos;
  

 final  CameraController controller;
 final  FrameModel frameConfig;
 final  List<XFile?> _capturedPhotos;
 List<XFile?> get capturedPhotos {
  if (_capturedPhotos is EqualUnmodifiableListView) return _capturedPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capturedPhotos);
}

 final  int? selectedIndexToRetake;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.frameConfig, frameConfig) || other.frameConfig == frameConfig)&&const DeepCollectionEquality().equals(other.capturedPhotos, _capturedPhotos)&&(identical(other.selectedIndexToRetake, selectedIndexToRetake) || other.selectedIndexToRetake == selectedIndexToRetake));
}


@override
int get hashCode {
    return Object.hash(runtimeType,controller,frameConfig,const DeepCollectionEquality().hash(_capturedPhotos),selectedIndexToRetake);
}

@override
String toString() {
    return 'CameraSessionState.review(controller: $controller, frameConfig: $frameConfig, capturedPhotos: $capturedPhotos, selectedIndexToRetake: $selectedIndexToRetake)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $CameraSessionStateCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@useResult
$Res call({
 CameraController controller, FrameModel frameConfig, List<XFile?> capturedPhotos, int? selectedIndexToRetake
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,Object? frameConfig = null,Object? capturedPhotos = null,Object? selectedIndexToRetake = freezed,}) {
  return _then(_Review(
controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController,frameConfig: null == frameConfig ? _self.frameConfig : frameConfig // ignore: cast_nullable_to_non_nullable
as FrameModel,capturedPhotos: null == capturedPhotos ? _self._capturedPhotos : capturedPhotos // ignore: cast_nullable_to_non_nullable
as List<XFile?>,selectedIndexToRetake: freezed == selectedIndexToRetake ? _self.selectedIndexToRetake : selectedIndexToRetake // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Error implements CameraSessionState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'CameraSessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CameraSessionStateCopyWith<$Res> {
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

/// Create a copy of CameraSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
