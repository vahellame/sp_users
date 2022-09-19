import 'package:sp_users/modules/photo/presentation/presentation.dart';
import 'package:sp_users/modules/photo/domain/domain.dart';

class UPhotoListItem extends StatelessWidget {
  const UPhotoListItem(
    this.photo, {
    this.index,
    Key? key,
  }) : super(key: key);

  final Photo photo;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.navigateTo(
            PhotoRoute(
              albumId: photo.albumId,
              tumbnailPhoto: photo,
              initialIndex: index,
            ),
          ),
          child: UNetworkImage(
            photo.thumbnailUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
