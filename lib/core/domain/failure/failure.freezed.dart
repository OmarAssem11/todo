// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canNotAccess,
    required TResult Function() unKnown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CanNotAccess value) canNotAccess,
    required TResult Function(_UnKnown value) unKnown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalFailureCopyWith<$Res> {
  factory $LocalFailureCopyWith(
          LocalFailure value, $Res Function(LocalFailure) then) =
      _$LocalFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocalFailureCopyWithImpl<$Res> implements $LocalFailureCopyWith<$Res> {
  _$LocalFailureCopyWithImpl(this._value, this._then);

  final LocalFailure _value;
  // ignore: unused_field
  final $Res Function(LocalFailure) _then;
}

/// @nodoc
abstract class _$$_CanNotAccessCopyWith<$Res> {
  factory _$$_CanNotAccessCopyWith(
          _$_CanNotAccess value, $Res Function(_$_CanNotAccess) then) =
      __$$_CanNotAccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CanNotAccessCopyWithImpl<$Res>
    extends _$LocalFailureCopyWithImpl<$Res>
    implements _$$_CanNotAccessCopyWith<$Res> {
  __$$_CanNotAccessCopyWithImpl(
      _$_CanNotAccess _value, $Res Function(_$_CanNotAccess) _then)
      : super(_value, (v) => _then(v as _$_CanNotAccess));

  @override
  _$_CanNotAccess get _value => super._value as _$_CanNotAccess;
}

/// @nodoc

class _$_CanNotAccess implements _CanNotAccess {
  const _$_CanNotAccess();

  @override
  String toString() {
    return 'LocalFailure.canNotAccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CanNotAccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canNotAccess,
    required TResult Function() unKnown,
  }) {
    return canNotAccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
  }) {
    return canNotAccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
    required TResult orElse(),
  }) {
    if (canNotAccess != null) {
      return canNotAccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CanNotAccess value) canNotAccess,
    required TResult Function(_UnKnown value) unKnown,
  }) {
    return canNotAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
  }) {
    return canNotAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
    required TResult orElse(),
  }) {
    if (canNotAccess != null) {
      return canNotAccess(this);
    }
    return orElse();
  }
}

abstract class _CanNotAccess implements LocalFailure {
  const factory _CanNotAccess() = _$_CanNotAccess;
}

/// @nodoc
abstract class _$$_UnKnownCopyWith<$Res> {
  factory _$$_UnKnownCopyWith(
          _$_UnKnown value, $Res Function(_$_UnKnown) then) =
      __$$_UnKnownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnKnownCopyWithImpl<$Res> extends _$LocalFailureCopyWithImpl<$Res>
    implements _$$_UnKnownCopyWith<$Res> {
  __$$_UnKnownCopyWithImpl(_$_UnKnown _value, $Res Function(_$_UnKnown) _then)
      : super(_value, (v) => _then(v as _$_UnKnown));

  @override
  _$_UnKnown get _value => super._value as _$_UnKnown;
}

/// @nodoc

class _$_UnKnown implements _UnKnown {
  const _$_UnKnown();

  @override
  String toString() {
    return 'LocalFailure.unKnown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnKnown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canNotAccess,
    required TResult Function() unKnown,
  }) {
    return unKnown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
  }) {
    return unKnown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canNotAccess,
    TResult Function()? unKnown,
    required TResult orElse(),
  }) {
    if (unKnown != null) {
      return unKnown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CanNotAccess value) canNotAccess,
    required TResult Function(_UnKnown value) unKnown,
  }) {
    return unKnown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
  }) {
    return unKnown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CanNotAccess value)? canNotAccess,
    TResult Function(_UnKnown value)? unKnown,
    required TResult orElse(),
  }) {
    if (unKnown != null) {
      return unKnown(this);
    }
    return orElse();
  }
}

abstract class _UnKnown implements LocalFailure {
  const factory _UnKnown() = _$_UnKnown;
}
