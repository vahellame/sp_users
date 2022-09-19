import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';

final commentRepositoryProvider = Provider<CommentRepository>(
  (ref) => CommentRepositoryImpl(
    CommentRestClient(ref.read<Dio>(dioProvider)),
  ),
);

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl(this._client);
  final CommentRestClient _client;

  @override
  Future<Either<Failure, List<Comment>>> getComments(
    int postId, {
    Pagination? pagination,
  }) {
    return _client
        .getComments(
          postId,
          start: pagination?.start,
          limit: pagination?.limit,
        )
        .toEntity();
  }

  @override
  Future<Either<Failure, Comment>> createComment(
    CreateCommentInput input,
  ) async {
    return _client.createComment(input).toEntity();
  }
}
