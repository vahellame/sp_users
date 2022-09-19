import 'package:sp_users/modules/post/domain/domain.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<Comment>>> getComments(
    int postId, {
    Pagination? pagination,
  });
  Future<Either<Failure, Comment>> createComment(CreateCommentInput input);
}
