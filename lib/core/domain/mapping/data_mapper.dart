import 'package:sp_users/core/domain/domain.dart';

extension DataMapper<T> on Future<T> {
  Future<Either<Failure, T>> toEntity() async {
    try {
      return Right(await this);
    } on DioError {
      return Left(ServerFailure());
    } catch (e) {
      return Left(DomainFailure());
    }
  }
}
