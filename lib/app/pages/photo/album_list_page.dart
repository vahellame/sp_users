import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';

class AlbumListPage extends StatelessWidget {
  const AlbumListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    final provider = albumListViewModelProvider(userId);

    return UScaffold(
      heroTag: 'albumsPage',
      title: context.localization.albums,
      body: UProvidedStateDecorator<List<Album>>(
        provider: provider,
        builder: (data, failure, ref) {
          return UPaginateListener(
            onFetchRequest: () => ref.read(provider.notifier).loadMore(),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
              itemBuilder: (_, index) => UAlbumListItem(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
