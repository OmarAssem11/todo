import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

abstract class AppException {}

@freezed
class LocalAppException extends AppException with _$LocalAppException {
  const factory LocalAppException.canNotAccess() = _CanNotAccess;
  const factory LocalAppException.unKnown() = _UnKnown;
}
