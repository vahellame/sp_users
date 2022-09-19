import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_comment_input.freezed.dart';
part 'create_comment_input.g.dart';

@freezed
class CreateCommentInput with _$CreateCommentInput {
  factory CreateCommentInput({
    required int postId,
    required String name,
    required String email,
    required String body,
  }) = _CreateCommentInput;

  factory CreateCommentInput.fromJson(Map<String, dynamic> json) => _$CreateCommentInputFromJson(json);
}
