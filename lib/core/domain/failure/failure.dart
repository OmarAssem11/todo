import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

abstract class Failure {}

@freezed
class LocalFailure extends Failure with _$LocalFailure {
  const factory LocalFailure.canNotAccess() = _CanNotAccess;
  const factory LocalFailure.unKnown() = _UnKnown;
}
