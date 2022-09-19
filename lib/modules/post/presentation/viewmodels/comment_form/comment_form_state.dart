import 'package:sp_users/modules/post/presentation/presentation.dart';
import 'package:sp_users/modules/user/domain/domain.dart';

part 'comment_form_state.freezed.dart';

@freezed
class CommentFormState with _$CommentFormState {
  const factory CommentFormState.initial(
    CommentEditingController commentEditingController, {
    required int postId,
  }) = CommentFormStateInitial;

  const factory CommentFormState.loading(
    CommentEditingController commentEditingController, {
    required int postId,
  }) = CommentFormStateLoading;

  const factory CommentFormState.error(
    CommentEditingController commentEditingController, {
    required int postId,
    required Failure failure,
  }) = CommentFormStateError;
}
