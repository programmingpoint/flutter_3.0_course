// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'github_repo_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubRepoDetailDto _$GithubRepoDetailDtoFromJson(Map<String, dynamic> json) {
  return _GithubRepoDetailDto.fromJson(json);
}

/// @nodoc
class _$GithubRepoDetailDtoTearOff {
  const _$GithubRepoDetailDtoTearOff();

  _GithubRepoDetailDto call(
      {required String fullName, required String html, required bool starred}) {
    return _GithubRepoDetailDto(
      fullName: fullName,
      html: html,
      starred: starred,
    );
  }

  GithubRepoDetailDto fromJson(Map<String, Object?> json) {
    return GithubRepoDetailDto.fromJson(json);
  }
}

/// @nodoc
const $GithubRepoDetailDto = _$GithubRepoDetailDtoTearOff();

/// @nodoc
mixin _$GithubRepoDetailDto {
  String get fullName => throw _privateConstructorUsedError;
  String get html => throw _privateConstructorUsedError;
  bool get starred => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubRepoDetailDtoCopyWith<GithubRepoDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubRepoDetailDtoCopyWith<$Res> {
  factory $GithubRepoDetailDtoCopyWith(
          GithubRepoDetailDto value, $Res Function(GithubRepoDetailDto) then) =
      _$GithubRepoDetailDtoCopyWithImpl<$Res>;
  $Res call({String fullName, String html, bool starred});
}

/// @nodoc
class _$GithubRepoDetailDtoCopyWithImpl<$Res>
    implements $GithubRepoDetailDtoCopyWith<$Res> {
  _$GithubRepoDetailDtoCopyWithImpl(this._value, this._then);

  final GithubRepoDetailDto _value;
  // ignore: unused_field
  final $Res Function(GithubRepoDetailDto) _then;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? html = freezed,
    Object? starred = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GithubRepoDetailDtoCopyWith<$Res>
    implements $GithubRepoDetailDtoCopyWith<$Res> {
  factory _$GithubRepoDetailDtoCopyWith(_GithubRepoDetailDto value,
          $Res Function(_GithubRepoDetailDto) then) =
      __$GithubRepoDetailDtoCopyWithImpl<$Res>;
  @override
  $Res call({String fullName, String html, bool starred});
}

/// @nodoc
class __$GithubRepoDetailDtoCopyWithImpl<$Res>
    extends _$GithubRepoDetailDtoCopyWithImpl<$Res>
    implements _$GithubRepoDetailDtoCopyWith<$Res> {
  __$GithubRepoDetailDtoCopyWithImpl(
      _GithubRepoDetailDto _value, $Res Function(_GithubRepoDetailDto) _then)
      : super(_value, (v) => _then(v as _GithubRepoDetailDto));

  @override
  _GithubRepoDetailDto get _value => super._value as _GithubRepoDetailDto;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? html = freezed,
    Object? starred = freezed,
  }) {
    return _then(_GithubRepoDetailDto(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      html: html == freezed
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
      starred: starred == freezed
          ? _value.starred
          : starred // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubRepoDetailDto extends _GithubRepoDetailDto {
  const _$_GithubRepoDetailDto(
      {required this.fullName, required this.html, required this.starred})
      : super._();

  factory _$_GithubRepoDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_GithubRepoDetailDtoFromJson(json);

  @override
  final String fullName;
  @override
  final String html;
  @override
  final bool starred;

  @override
  String toString() {
    return 'GithubRepoDetailDto(fullName: $fullName, html: $html, starred: $starred)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubRepoDetailDto &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.html, html) || other.html == html) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullName, html, starred);

  @JsonKey(ignore: true)
  @override
  _$GithubRepoDetailDtoCopyWith<_GithubRepoDetailDto> get copyWith =>
      __$GithubRepoDetailDtoCopyWithImpl<_GithubRepoDetailDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubRepoDetailDtoToJson(this);
  }
}

abstract class _GithubRepoDetailDto extends GithubRepoDetailDto {
  const factory _GithubRepoDetailDto(
      {required String fullName,
      required String html,
      required bool starred}) = _$_GithubRepoDetailDto;
  const _GithubRepoDetailDto._() : super._();

  factory _GithubRepoDetailDto.fromJson(Map<String, dynamic> json) =
      _$_GithubRepoDetailDto.fromJson;

  @override
  String get fullName;
  @override
  String get html;
  @override
  bool get starred;
  @override
  @JsonKey(ignore: true)
  _$GithubRepoDetailDtoCopyWith<_GithubRepoDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
