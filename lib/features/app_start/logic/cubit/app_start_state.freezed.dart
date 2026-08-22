// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState()';
}


}

/// @nodoc
class $AppStartStateCopyWith<$Res>  {
$AppStartStateCopyWith(AppStartState _, $Res Function(AppStartState) __);
}


/// Adds pattern-matching-related methods to [AppStartState].
extension AppStartStatePatterns on AppStartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _GoToOnboarding value)?  goToOnboarding,TResult Function( _GoToLogin value)?  goToLogin,TResult Function( _GoToHome value)?  goToHome,TResult Function( _GoToLocation value)?  goToLocation,TResult Function( _GoToWelcome value)?  goToWelcome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _GoToOnboarding() when goToOnboarding != null:
return goToOnboarding(_that);case _GoToLogin() when goToLogin != null:
return goToLogin(_that);case _GoToHome() when goToHome != null:
return goToHome(_that);case _GoToLocation() when goToLocation != null:
return goToLocation(_that);case _GoToWelcome() when goToWelcome != null:
return goToWelcome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _GoToOnboarding value)  goToOnboarding,required TResult Function( _GoToLogin value)  goToLogin,required TResult Function( _GoToHome value)  goToHome,required TResult Function( _GoToLocation value)  goToLocation,required TResult Function( _GoToWelcome value)  goToWelcome,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _GoToOnboarding():
return goToOnboarding(_that);case _GoToLogin():
return goToLogin(_that);case _GoToHome():
return goToHome(_that);case _GoToLocation():
return goToLocation(_that);case _GoToWelcome():
return goToWelcome(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _GoToOnboarding value)?  goToOnboarding,TResult? Function( _GoToLogin value)?  goToLogin,TResult? Function( _GoToHome value)?  goToHome,TResult? Function( _GoToLocation value)?  goToLocation,TResult? Function( _GoToWelcome value)?  goToWelcome,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _GoToOnboarding() when goToOnboarding != null:
return goToOnboarding(_that);case _GoToLogin() when goToLogin != null:
return goToLogin(_that);case _GoToHome() when goToHome != null:
return goToHome(_that);case _GoToLocation() when goToLocation != null:
return goToLocation(_that);case _GoToWelcome() when goToWelcome != null:
return goToWelcome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  goToOnboarding,TResult Function()?  goToLogin,TResult Function()?  goToHome,TResult Function()?  goToLocation,TResult Function()?  goToWelcome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _GoToOnboarding() when goToOnboarding != null:
return goToOnboarding();case _GoToLogin() when goToLogin != null:
return goToLogin();case _GoToHome() when goToHome != null:
return goToHome();case _GoToLocation() when goToLocation != null:
return goToLocation();case _GoToWelcome() when goToWelcome != null:
return goToWelcome();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  goToOnboarding,required TResult Function()  goToLogin,required TResult Function()  goToHome,required TResult Function()  goToLocation,required TResult Function()  goToWelcome,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _GoToOnboarding():
return goToOnboarding();case _GoToLogin():
return goToLogin();case _GoToHome():
return goToHome();case _GoToLocation():
return goToLocation();case _GoToWelcome():
return goToWelcome();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  goToOnboarding,TResult? Function()?  goToLogin,TResult? Function()?  goToHome,TResult? Function()?  goToLocation,TResult? Function()?  goToWelcome,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _GoToOnboarding() when goToOnboarding != null:
return goToOnboarding();case _GoToLogin() when goToLogin != null:
return goToLogin();case _GoToHome() when goToHome != null:
return goToHome();case _GoToLocation() when goToLocation != null:
return goToLocation();case _GoToWelcome() when goToWelcome != null:
return goToWelcome();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppStartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.initial()';
}


}




/// @nodoc


class _Loading implements AppStartState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.loading()';
}


}




/// @nodoc


class _GoToOnboarding implements AppStartState {
  const _GoToOnboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.goToOnboarding()';
}


}




/// @nodoc


class _GoToLogin implements AppStartState {
  const _GoToLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.goToLogin()';
}


}




/// @nodoc


class _GoToHome implements AppStartState {
  const _GoToHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.goToHome()';
}


}




/// @nodoc


class _GoToLocation implements AppStartState {
  const _GoToLocation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToLocation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.goToLocation()';
}


}




/// @nodoc


class _GoToWelcome implements AppStartState {
  const _GoToWelcome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoToWelcome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.goToWelcome()';
}


}




// dart format on
