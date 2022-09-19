import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/infrastructure/infrastructure.dart';

part 'photo_rest_client.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class PhotoRestClient {
  factory PhotoRestClient(Dio dio) = _PhotoRestClient;

  @GET('/photos/')
  Future<List<Photo>> getPhotos(
    @Query("albumId") int albumId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @GET('/photos/{id}')
  Future<Photo> getPhotoById(@Path("id") int id);
}
