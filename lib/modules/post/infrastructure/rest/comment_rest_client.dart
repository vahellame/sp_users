import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';

part 'comment_rest_client.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class CommentRestClient {
  factory CommentRestClient(Dio dio) = _CommentRestClient;

  @GET('/comments/')
  Future<List<Comment>> getComments(
    @Query("postId") int postId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @POST('/comments/')
  Future<Comment> createComment(@Body() CreateCommentInput id);
}
