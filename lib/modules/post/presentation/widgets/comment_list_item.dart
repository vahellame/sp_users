import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/user/presentation/presentation.dart';

class UCommentListItem extends StatelessWidget {
  const UCommentListItem(
    this.comment, {
    Key? key,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UCustomUserListItem(comment.name, comment.email),
        Padding(
          padding: DesignConstants.padding.copyWith(top: 0),
          child: Text(comment.body),
        ),
      ],
    );
  }
}
