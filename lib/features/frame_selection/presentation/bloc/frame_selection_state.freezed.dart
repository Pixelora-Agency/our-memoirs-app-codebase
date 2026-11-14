// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FrameState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FrameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FrameState()';
}


}

/// @nodoc
class $FrameStateCopyWith<$Res>  {
$FrameStateCopyWith(FrameState _, $Res Function(FrameState) __);
}


/// Adds pattern-matching-related methods to [FrameState].
extension FrameStatePatterns on FrameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SelectedFrame value)?  selectedFrame,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SelectedFrame() when selectedFrame != null:
return selectedFrame(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SelectedFrame value)  selectedFrame,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SelectedFrame():
return selectedFrame(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SelectedFrame value)?  selectedFrame,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SelectedFrame() when selectedFrame != null:
return selectedFrame(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( FrameModel selectedFrame)?  selectedFrame,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SelectedFrame() when selectedFrame != null:
return selectedFrame(_that.selectedFrame);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( FrameModel selectedFrame)  selectedFrame,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SelectedFrame():
return selectedFrame(_that.selectedFrame);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( FrameModel selectedFrame)?  selectedFrame,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SelectedFrame() when selectedFrame != null:
return selectedFrame(_that.selectedFrame);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FrameState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FrameState.initial()';
}


}




/// @nodoc


class _SelectedFrame implements FrameState {
  const _SelectedFrame({required this.selectedFrame});
  

 final  FrameModel selectedFrame;

/// Create a copy of FrameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedFrameCopyWith<_SelectedFrame> get copyWith => __$SelectedFrameCopyWithImpl<_SelectedFrame>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedFrame&&(identical(other.selectedFrame, selectedFrame) || other.selectedFrame == selectedFrame));
}


@override
int get hashCode {
    return Object.hash(runtimeType,selectedFrame);
}

@override
String toString() {
    return 'FrameState.selectedFrame(selectedFrame: $selectedFrame)';
}


}

/// @nodoc
abstract mixin class _$SelectedFrameCopyWith<$Res> implements $FrameStateCopyWith<$Res> {
  factory _$SelectedFrameCopyWith(_SelectedFrame value, $Res Function(_SelectedFrame) _then) = __$SelectedFrameCopyWithImpl;
@useResult
$Res call({
 FrameModel selectedFrame
});




}
/// @nodoc
class __$SelectedFrameCopyWithImpl<$Res>
    implements _$SelectedFrameCopyWith<$Res> {
  __$SelectedFrameCopyWithImpl(this._self, this._then);

  final _SelectedFrame _self;
  final $Res Function(_SelectedFrame) _then;

/// Create a copy of FrameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedFrame = null,}) {
  return _then(_SelectedFrame(
selectedFrame: null == selectedFrame ? _self.selectedFrame : selectedFrame // ignore: cast_nullable_to_non_nullable
as FrameModel,
  ));
}


}

// dart format on
