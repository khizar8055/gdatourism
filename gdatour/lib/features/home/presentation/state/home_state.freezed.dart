// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  RegionModel? get selectedRegion => throw _privateConstructorUsedError;
  WeatherModel? get currentWeather => throw _privateConstructorUsedError;
  List<TravelAlertModel> get travelAlerts => throw _privateConstructorUsedError;
  List<RegionModel> get featuredRegions => throw _privateConstructorUsedError;
  List<AttractionModel> get attractions => throw _privateConstructorUsedError;
  List<QuickActionModel> get quickActions => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    bool isLoading,
    RegionModel? selectedRegion,
    WeatherModel? currentWeather,
    List<TravelAlertModel> travelAlerts,
    List<RegionModel> featuredRegions,
    List<AttractionModel> attractions,
    List<QuickActionModel> quickActions,
    String? errorMessage,
  });

  $RegionModelCopyWith<$Res>? get selectedRegion;
  $WeatherModelCopyWith<$Res>? get currentWeather;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedRegion = freezed,
    Object? currentWeather = freezed,
    Object? travelAlerts = null,
    Object? featuredRegions = null,
    Object? attractions = null,
    Object? quickActions = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            selectedRegion: freezed == selectedRegion
                ? _value.selectedRegion
                : selectedRegion // ignore: cast_nullable_to_non_nullable
                      as RegionModel?,
            currentWeather: freezed == currentWeather
                ? _value.currentWeather
                : currentWeather // ignore: cast_nullable_to_non_nullable
                      as WeatherModel?,
            travelAlerts: null == travelAlerts
                ? _value.travelAlerts
                : travelAlerts // ignore: cast_nullable_to_non_nullable
                      as List<TravelAlertModel>,
            featuredRegions: null == featuredRegions
                ? _value.featuredRegions
                : featuredRegions // ignore: cast_nullable_to_non_nullable
                      as List<RegionModel>,
            attractions: null == attractions
                ? _value.attractions
                : attractions // ignore: cast_nullable_to_non_nullable
                      as List<AttractionModel>,
            quickActions: null == quickActions
                ? _value.quickActions
                : quickActions // ignore: cast_nullable_to_non_nullable
                      as List<QuickActionModel>,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionModelCopyWith<$Res>? get selectedRegion {
    if (_value.selectedRegion == null) {
      return null;
    }

    return $RegionModelCopyWith<$Res>(_value.selectedRegion!, (value) {
      return _then(_value.copyWith(selectedRegion: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherModelCopyWith<$Res>? get currentWeather {
    if (_value.currentWeather == null) {
      return null;
    }

    return $WeatherModelCopyWith<$Res>(_value.currentWeather!, (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    RegionModel? selectedRegion,
    WeatherModel? currentWeather,
    List<TravelAlertModel> travelAlerts,
    List<RegionModel> featuredRegions,
    List<AttractionModel> attractions,
    List<QuickActionModel> quickActions,
    String? errorMessage,
  });

  @override
  $RegionModelCopyWith<$Res>? get selectedRegion;
  @override
  $WeatherModelCopyWith<$Res>? get currentWeather;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedRegion = freezed,
    Object? currentWeather = freezed,
    Object? travelAlerts = null,
    Object? featuredRegions = null,
    Object? attractions = null,
    Object? quickActions = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        selectedRegion: freezed == selectedRegion
            ? _value.selectedRegion
            : selectedRegion // ignore: cast_nullable_to_non_nullable
                  as RegionModel?,
        currentWeather: freezed == currentWeather
            ? _value.currentWeather
            : currentWeather // ignore: cast_nullable_to_non_nullable
                  as WeatherModel?,
        travelAlerts: null == travelAlerts
            ? _value._travelAlerts
            : travelAlerts // ignore: cast_nullable_to_non_nullable
                  as List<TravelAlertModel>,
        featuredRegions: null == featuredRegions
            ? _value._featuredRegions
            : featuredRegions // ignore: cast_nullable_to_non_nullable
                  as List<RegionModel>,
        attractions: null == attractions
            ? _value._attractions
            : attractions // ignore: cast_nullable_to_non_nullable
                  as List<AttractionModel>,
        quickActions: null == quickActions
            ? _value._quickActions
            : quickActions // ignore: cast_nullable_to_non_nullable
                  as List<QuickActionModel>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.isLoading = false,
    this.selectedRegion,
    this.currentWeather,
    final List<TravelAlertModel> travelAlerts = const [],
    final List<RegionModel> featuredRegions = const [],
    final List<AttractionModel> attractions = const [],
    final List<QuickActionModel> quickActions = const [],
    this.errorMessage,
  }) : _travelAlerts = travelAlerts,
       _featuredRegions = featuredRegions,
       _attractions = attractions,
       _quickActions = quickActions;

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final RegionModel? selectedRegion;
  @override
  final WeatherModel? currentWeather;
  final List<TravelAlertModel> _travelAlerts;
  @override
  @JsonKey()
  List<TravelAlertModel> get travelAlerts {
    if (_travelAlerts is EqualUnmodifiableListView) return _travelAlerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travelAlerts);
  }

  final List<RegionModel> _featuredRegions;
  @override
  @JsonKey()
  List<RegionModel> get featuredRegions {
    if (_featuredRegions is EqualUnmodifiableListView) return _featuredRegions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredRegions);
  }

  final List<AttractionModel> _attractions;
  @override
  @JsonKey()
  List<AttractionModel> get attractions {
    if (_attractions is EqualUnmodifiableListView) return _attractions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractions);
  }

  final List<QuickActionModel> _quickActions;
  @override
  @JsonKey()
  List<QuickActionModel> get quickActions {
    if (_quickActions is EqualUnmodifiableListView) return _quickActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quickActions);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, selectedRegion: $selectedRegion, currentWeather: $currentWeather, travelAlerts: $travelAlerts, featuredRegions: $featuredRegions, attractions: $attractions, quickActions: $quickActions, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion) &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            const DeepCollectionEquality().equals(
              other._travelAlerts,
              _travelAlerts,
            ) &&
            const DeepCollectionEquality().equals(
              other._featuredRegions,
              _featuredRegions,
            ) &&
            const DeepCollectionEquality().equals(
              other._attractions,
              _attractions,
            ) &&
            const DeepCollectionEquality().equals(
              other._quickActions,
              _quickActions,
            ) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    selectedRegion,
    currentWeather,
    const DeepCollectionEquality().hash(_travelAlerts),
    const DeepCollectionEquality().hash(_featuredRegions),
    const DeepCollectionEquality().hash(_attractions),
    const DeepCollectionEquality().hash(_quickActions),
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final bool isLoading,
    final RegionModel? selectedRegion,
    final WeatherModel? currentWeather,
    final List<TravelAlertModel> travelAlerts,
    final List<RegionModel> featuredRegions,
    final List<AttractionModel> attractions,
    final List<QuickActionModel> quickActions,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  RegionModel? get selectedRegion;
  @override
  WeatherModel? get currentWeather;
  @override
  List<TravelAlertModel> get travelAlerts;
  @override
  List<RegionModel> get featuredRegions;
  @override
  List<AttractionModel> get attractions;
  @override
  List<QuickActionModel> get quickActions;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
