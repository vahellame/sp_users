import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

final commentFormViewModelProvider = StateNotifierProviderFamily<CommentFormViewModel, CommentFormState, int>(
  (ref, postId) {
    return CommentFormViewModel(
      ref.read<CommentRepository>(commentRepositoryProvider),
      postId,
    );
  },
);

class CommentFormViewModel extends StateNotifier<CommentFormState> {
  CommentFormViewModel(
    this._commentRepository,
    int postId,
  ) : super(
          CommentFormState.initial(
            CommentEditingController(),
            postId: postId,
          ),
        );

  final CommentRepository _commentRepository;

  Future<Comment?> sendComment() async {
    // assert(state is! CommentFormStateLoading);
    state = CommentFormState.loading(
      state.commentEditingController,
      postId: state.postId,
    );

    final response = await _commentRepository.createComment(
      CreateCommentInput(
        postId: state.postId,
        name: state.commentEditingController.nameController.text,
        email: state.commentEditingController.emailController.text,
        body: state.commentEditingController.textController.text,
      ),
    );

    state = response.fold(
      (l) => CommentFormState.error(
        state.commentEditingController,
        postId: state.postId,
        failure: l,
      ),
      (r) => CommentFormState.initial(
        state.commentEditingController..clear(),
        postId: state.postId,
      ),
    );

    if (state is CommentFormStateInitial) {
      return response.getRight().toNullable();
    }

    return null;
  }
}
