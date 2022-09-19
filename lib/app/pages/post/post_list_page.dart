import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

class PostListPage extends StatelessWidget {
  const PostListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    final provider = postListViewModelProvider(userId);

    return UScaffold(
      heroTag: 'postsPage',
      title: context.localization.posts,
      body: UProvidedStateDecorator<List<Post>>(
        provider: provider,
        builder: (data, failure, ref) {
          return UPaginateListener(
            onFetchRequest: () => ref.read(provider.notifier).loadMore(),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
              itemBuilder: (_, index) => UPostListItem(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
