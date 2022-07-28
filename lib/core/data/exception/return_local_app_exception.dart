import 'package:todo/core/data/exception/app_exception.dart';

LocalAppException returnLocalAppException(Object exception) =>
    const LocalAppException.canNotAccess();
