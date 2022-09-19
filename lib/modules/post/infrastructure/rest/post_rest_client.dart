import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';

part 'post_rest_client.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class PostRestClient {
  factory PostRestClient(Dio dio) = _PostRestClient;

  @GET('/posts/')
  Future<List<Post>> getPosts(
    @Query("userId") int userId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @GET('/posts/{id}')
  Future<Post> getPostById(@Path("id") int id);
}
