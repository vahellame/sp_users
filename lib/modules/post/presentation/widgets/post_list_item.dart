import 'package:sp_users/modules/post/presentation/presentation.dart';
import 'package:sp_users/modules/post/domain/domain.dart';

class UPostListItem extends StatelessWidget {
  const UPostListItem(
    this.post, {
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UIconBox(FeatherIcons.book),
      title: Text(post.title, maxLines: 1),
      subtitle: Text(post.body, maxLines: 1),
      onTap: () => context.navigateTo(
        PostRoute(postId: post.id, post: post),
      ),
    );
  }
}
