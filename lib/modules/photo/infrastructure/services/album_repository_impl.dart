import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/infrastructure/infrastructure.dart';

final albumRepositoryProvider = Provider<AlbumRepository>(
  (ref) => AlbumRepositoryImpl(
    AlbumRestClient(ref.read<Dio>(dioProvider)),
  ),
);

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl(this._client);
  final AlbumRestClient _client;

  @override
  Future<Either<Failure, List<Album>>> getAlbums(
    int userId, {
    Pagination? pagination,
  }) {
    return _client
        .getAlbums(
          userId,
          start: pagination?.start,
          limit: pagination?.limit,
        )
        .toEntity();
  }

  @override
  Future<Either<Failure, Album>> getAlbumById(int id) async {
    return _client.getAlbumById(id).toEntity();
  }
}
