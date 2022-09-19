import 'package:sp_users/modules/photo/domain/domain.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photo>>> getPhotos(
    int albumId, {
    Pagination? pagination,
  });
  Future<Either<Failure, Photo>> getPhotoById(int id);
}
