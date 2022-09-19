import 'package:sp_users/modules/photo/presentation/presentation.dart';
import 'package:sp_users/modules/photo/domain/domain.dart';

class UAlbumListItem extends StatelessWidget {
  const UAlbumListItem(
    this.album, {
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const UIconBox(FeatherIcons.image),
      title: Text(album.title, maxLines: 1),
      onTap: () => context.navigateTo(
        AlbumRoute(albumId: album.id, album: album),
      ),
    );
  }
}
