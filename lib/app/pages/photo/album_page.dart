import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';

class AlbumPage extends ConsumerWidget {
  const AlbumPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.album,
  }) : super(key: key);

  final int? albumId;
  final Album? album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = albumViewModelProvider(
      ModelValue(id: albumId, cachedModel: album),
    );

    return UScaffold(
      heroTag: 'albumsPage',
      title: context.localization.album,
      body: UProvidedStateDecorator<Album>(
        provider: provider,
        builder: (data, _, __) => _AlbumContent(data),
      ),
    );
  }
}

class _AlbumContent extends ConsumerWidget {
  const _AlbumContent(
    this.album, {
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UStateDecorator<List<Photo>>(
      state: ref.watch(photoListViewModelProvider(album.id)),
      builder: (data, _) => GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) => UPhotoListItem(
          data[index],
          index: index,
        ),
        itemCount: data.length,
      ),
    );
  }
}
