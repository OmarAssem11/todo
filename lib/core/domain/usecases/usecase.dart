import 'package:dartz/dartz.dart';
import 'package:todo/core/domain/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
