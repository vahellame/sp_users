import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/infrastructure/infrastructure.dart';

part 'album_rest_client.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class AlbumRestClient {
  factory AlbumRestClient(Dio dio) = _AlbumRestClient;

  @GET('/albums/')
  Future<List<Album>> getAlbums(
    @Query("userId") int userId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @GET('/albums/{id}')
  Future<Album> getAlbumById(@Path("id") int id);
}
