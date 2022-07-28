import 'package:todo/core/data/exception/app_exception.dart';
import 'package:todo/core/domain/failure/failure.dart';

Failure returnFailure(AppException appException) {
  appException as LocalAppException;
  return appException.map(
    canNotAccess: (_) => const LocalFailure.canNotAccess(),
    unKnown: (_) => const LocalFailure.unKnown(),
  );
}
