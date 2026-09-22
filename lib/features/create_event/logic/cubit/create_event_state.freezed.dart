// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateEventState {

 CreateEventStatus get status; String? get eventTitle; String? get eventCategory; String? get eventDescription; String? get eventLocation; DateTime? get startDate; TimeOfDay? get startTime; DateTime? get endDate; TimeOfDay? get endTime; bool get isOnlineEvent; XFile? get eventCoverImage; List<XFile> get eventGalleryPhotos; List<TicketTierModel> get eventTicketTiers; SeatingConfigModel? get seatingConfig; String? get errorMessage;
/// Create a copy of CreateEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEventStateCopyWith<CreateEventState> get copyWith => _$CreateEventStateCopyWithImpl<CreateEventState>(this as CreateEventState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEventState&&(identical(other.status, status) || other.status == status)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.eventCategory, eventCategory) || other.eventCategory == eventCategory)&&(identical(other.eventDescription, eventDescription) || other.eventDescription == eventDescription)&&(identical(other.eventLocation, eventLocation) || other.eventLocation == eventLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isOnlineEvent, isOnlineEvent) || other.isOnlineEvent == isOnlineEvent)&&(identical(other.eventCoverImage, eventCoverImage) || other.eventCoverImage == eventCoverImage)&&const DeepCollectionEquality().equals(other.eventGalleryPhotos, eventGalleryPhotos)&&const DeepCollectionEquality().equals(other.eventTicketTiers, eventTicketTiers)&&(identical(other.seatingConfig, seatingConfig) || other.seatingConfig == seatingConfig)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,eventTitle,eventCategory,eventDescription,eventLocation,startDate,startTime,endDate,endTime,isOnlineEvent,eventCoverImage,const DeepCollectionEquality().hash(eventGalleryPhotos),const DeepCollectionEquality().hash(eventTicketTiers),seatingConfig,errorMessage);

@override
String toString() {
  return 'CreateEventState(status: $status, eventTitle: $eventTitle, eventCategory: $eventCategory, eventDescription: $eventDescription, eventLocation: $eventLocation, startDate: $startDate, startTime: $startTime, endDate: $endDate, endTime: $endTime, isOnlineEvent: $isOnlineEvent, eventCoverImage: $eventCoverImage, eventGalleryPhotos: $eventGalleryPhotos, eventTicketTiers: $eventTicketTiers, seatingConfig: $seatingConfig, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CreateEventStateCopyWith<$Res>  {
  factory $CreateEventStateCopyWith(CreateEventState value, $Res Function(CreateEventState) _then) = _$CreateEventStateCopyWithImpl;
@useResult
$Res call({
 CreateEventStatus status, String? eventTitle, String? eventCategory, String? eventDescription, String? eventLocation, DateTime? startDate, TimeOfDay? startTime, DateTime? endDate, TimeOfDay? endTime, bool isOnlineEvent, XFile? eventCoverImage, List<XFile> eventGalleryPhotos, List<TicketTierModel> eventTicketTiers, SeatingConfigModel? seatingConfig, String? errorMessage
});




}
/// @nodoc
class _$CreateEventStateCopyWithImpl<$Res>
    implements $CreateEventStateCopyWith<$Res> {
  _$CreateEventStateCopyWithImpl(this._self, this._then);

  final CreateEventState _self;
  final $Res Function(CreateEventState) _then;

/// Create a copy of CreateEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? eventTitle = freezed,Object? eventCategory = freezed,Object? eventDescription = freezed,Object? eventLocation = freezed,Object? startDate = freezed,Object? startTime = freezed,Object? endDate = freezed,Object? endTime = freezed,Object? isOnlineEvent = null,Object? eventCoverImage = freezed,Object? eventGalleryPhotos = null,Object? eventTicketTiers = null,Object? seatingConfig = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateEventStatus,eventTitle: freezed == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String?,eventCategory: freezed == eventCategory ? _self.eventCategory : eventCategory // ignore: cast_nullable_to_non_nullable
as String?,eventDescription: freezed == eventDescription ? _self.eventDescription : eventDescription // ignore: cast_nullable_to_non_nullable
as String?,eventLocation: freezed == eventLocation ? _self.eventLocation : eventLocation // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isOnlineEvent: null == isOnlineEvent ? _self.isOnlineEvent : isOnlineEvent // ignore: cast_nullable_to_non_nullable
as bool,eventCoverImage: freezed == eventCoverImage ? _self.eventCoverImage : eventCoverImage // ignore: cast_nullable_to_non_nullable
as XFile?,eventGalleryPhotos: null == eventGalleryPhotos ? _self.eventGalleryPhotos : eventGalleryPhotos // ignore: cast_nullable_to_non_nullable
as List<XFile>,eventTicketTiers: null == eventTicketTiers ? _self.eventTicketTiers : eventTicketTiers // ignore: cast_nullable_to_non_nullable
as List<TicketTierModel>,seatingConfig: freezed == seatingConfig ? _self.seatingConfig : seatingConfig // ignore: cast_nullable_to_non_nullable
as SeatingConfigModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateEventState].
extension CreateEventStatePatterns on CreateEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEventState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEventState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEventState value)  $default,){
final _that = this;
switch (_that) {
case _CreateEventState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEventState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEventState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateEventStatus status,  String? eventTitle,  String? eventCategory,  String? eventDescription,  String? eventLocation,  DateTime? startDate,  TimeOfDay? startTime,  DateTime? endDate,  TimeOfDay? endTime,  bool isOnlineEvent,  XFile? eventCoverImage,  List<XFile> eventGalleryPhotos,  List<TicketTierModel> eventTicketTiers,  SeatingConfigModel? seatingConfig,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEventState() when $default != null:
return $default(_that.status,_that.eventTitle,_that.eventCategory,_that.eventDescription,_that.eventLocation,_that.startDate,_that.startTime,_that.endDate,_that.endTime,_that.isOnlineEvent,_that.eventCoverImage,_that.eventGalleryPhotos,_that.eventTicketTiers,_that.seatingConfig,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateEventStatus status,  String? eventTitle,  String? eventCategory,  String? eventDescription,  String? eventLocation,  DateTime? startDate,  TimeOfDay? startTime,  DateTime? endDate,  TimeOfDay? endTime,  bool isOnlineEvent,  XFile? eventCoverImage,  List<XFile> eventGalleryPhotos,  List<TicketTierModel> eventTicketTiers,  SeatingConfigModel? seatingConfig,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CreateEventState():
return $default(_that.status,_that.eventTitle,_that.eventCategory,_that.eventDescription,_that.eventLocation,_that.startDate,_that.startTime,_that.endDate,_that.endTime,_that.isOnlineEvent,_that.eventCoverImage,_that.eventGalleryPhotos,_that.eventTicketTiers,_that.seatingConfig,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateEventStatus status,  String? eventTitle,  String? eventCategory,  String? eventDescription,  String? eventLocation,  DateTime? startDate,  TimeOfDay? startTime,  DateTime? endDate,  TimeOfDay? endTime,  bool isOnlineEvent,  XFile? eventCoverImage,  List<XFile> eventGalleryPhotos,  List<TicketTierModel> eventTicketTiers,  SeatingConfigModel? seatingConfig,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CreateEventState() when $default != null:
return $default(_that.status,_that.eventTitle,_that.eventCategory,_that.eventDescription,_that.eventLocation,_that.startDate,_that.startTime,_that.endDate,_that.endTime,_that.isOnlineEvent,_that.eventCoverImage,_that.eventGalleryPhotos,_that.eventTicketTiers,_that.seatingConfig,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CreateEventState implements CreateEventState {
  const _CreateEventState({this.status = CreateEventStatus.initial, this.eventTitle, this.eventCategory, this.eventDescription, this.eventLocation, this.startDate, this.startTime, this.endDate, this.endTime, this.isOnlineEvent = true, this.eventCoverImage, final  List<XFile> eventGalleryPhotos = const [], final  List<TicketTierModel> eventTicketTiers = const [], this.seatingConfig, this.errorMessage}): _eventGalleryPhotos = eventGalleryPhotos,_eventTicketTiers = eventTicketTiers;
  

@override@JsonKey() final  CreateEventStatus status;
@override final  String? eventTitle;
@override final  String? eventCategory;
@override final  String? eventDescription;
@override final  String? eventLocation;
@override final  DateTime? startDate;
@override final  TimeOfDay? startTime;
@override final  DateTime? endDate;
@override final  TimeOfDay? endTime;
@override@JsonKey() final  bool isOnlineEvent;
@override final  XFile? eventCoverImage;
 final  List<XFile> _eventGalleryPhotos;
@override@JsonKey() List<XFile> get eventGalleryPhotos {
  if (_eventGalleryPhotos is EqualUnmodifiableListView) return _eventGalleryPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eventGalleryPhotos);
}

 final  List<TicketTierModel> _eventTicketTiers;
@override@JsonKey() List<TicketTierModel> get eventTicketTiers {
  if (_eventTicketTiers is EqualUnmodifiableListView) return _eventTicketTiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eventTicketTiers);
}

@override final  SeatingConfigModel? seatingConfig;
@override final  String? errorMessage;

/// Create a copy of CreateEventState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEventStateCopyWith<_CreateEventState> get copyWith => __$CreateEventStateCopyWithImpl<_CreateEventState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEventState&&(identical(other.status, status) || other.status == status)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.eventCategory, eventCategory) || other.eventCategory == eventCategory)&&(identical(other.eventDescription, eventDescription) || other.eventDescription == eventDescription)&&(identical(other.eventLocation, eventLocation) || other.eventLocation == eventLocation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isOnlineEvent, isOnlineEvent) || other.isOnlineEvent == isOnlineEvent)&&(identical(other.eventCoverImage, eventCoverImage) || other.eventCoverImage == eventCoverImage)&&const DeepCollectionEquality().equals(other._eventGalleryPhotos, _eventGalleryPhotos)&&const DeepCollectionEquality().equals(other._eventTicketTiers, _eventTicketTiers)&&(identical(other.seatingConfig, seatingConfig) || other.seatingConfig == seatingConfig)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,eventTitle,eventCategory,eventDescription,eventLocation,startDate,startTime,endDate,endTime,isOnlineEvent,eventCoverImage,const DeepCollectionEquality().hash(_eventGalleryPhotos),const DeepCollectionEquality().hash(_eventTicketTiers),seatingConfig,errorMessage);

@override
String toString() {
  return 'CreateEventState(status: $status, eventTitle: $eventTitle, eventCategory: $eventCategory, eventDescription: $eventDescription, eventLocation: $eventLocation, startDate: $startDate, startTime: $startTime, endDate: $endDate, endTime: $endTime, isOnlineEvent: $isOnlineEvent, eventCoverImage: $eventCoverImage, eventGalleryPhotos: $eventGalleryPhotos, eventTicketTiers: $eventTicketTiers, seatingConfig: $seatingConfig, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CreateEventStateCopyWith<$Res> implements $CreateEventStateCopyWith<$Res> {
  factory _$CreateEventStateCopyWith(_CreateEventState value, $Res Function(_CreateEventState) _then) = __$CreateEventStateCopyWithImpl;
@override @useResult
$Res call({
 CreateEventStatus status, String? eventTitle, String? eventCategory, String? eventDescription, String? eventLocation, DateTime? startDate, TimeOfDay? startTime, DateTime? endDate, TimeOfDay? endTime, bool isOnlineEvent, XFile? eventCoverImage, List<XFile> eventGalleryPhotos, List<TicketTierModel> eventTicketTiers, SeatingConfigModel? seatingConfig, String? errorMessage
});




}
/// @nodoc
class __$CreateEventStateCopyWithImpl<$Res>
    implements _$CreateEventStateCopyWith<$Res> {
  __$CreateEventStateCopyWithImpl(this._self, this._then);

  final _CreateEventState _self;
  final $Res Function(_CreateEventState) _then;

/// Create a copy of CreateEventState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? eventTitle = freezed,Object? eventCategory = freezed,Object? eventDescription = freezed,Object? eventLocation = freezed,Object? startDate = freezed,Object? startTime = freezed,Object? endDate = freezed,Object? endTime = freezed,Object? isOnlineEvent = null,Object? eventCoverImage = freezed,Object? eventGalleryPhotos = null,Object? eventTicketTiers = null,Object? seatingConfig = freezed,Object? errorMessage = freezed,}) {
  return _then(_CreateEventState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateEventStatus,eventTitle: freezed == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String?,eventCategory: freezed == eventCategory ? _self.eventCategory : eventCategory // ignore: cast_nullable_to_non_nullable
as String?,eventDescription: freezed == eventDescription ? _self.eventDescription : eventDescription // ignore: cast_nullable_to_non_nullable
as String?,eventLocation: freezed == eventLocation ? _self.eventLocation : eventLocation // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isOnlineEvent: null == isOnlineEvent ? _self.isOnlineEvent : isOnlineEvent // ignore: cast_nullable_to_non_nullable
as bool,eventCoverImage: freezed == eventCoverImage ? _self.eventCoverImage : eventCoverImage // ignore: cast_nullable_to_non_nullable
as XFile?,eventGalleryPhotos: null == eventGalleryPhotos ? _self._eventGalleryPhotos : eventGalleryPhotos // ignore: cast_nullable_to_non_nullable
as List<XFile>,eventTicketTiers: null == eventTicketTiers ? _self._eventTicketTiers : eventTicketTiers // ignore: cast_nullable_to_non_nullable
as List<TicketTierModel>,seatingConfig: freezed == seatingConfig ? _self.seatingConfig : seatingConfig // ignore: cast_nullable_to_non_nullable
as SeatingConfigModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
