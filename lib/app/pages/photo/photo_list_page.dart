import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';

class PhotoPage extends ConsumerWidget {
  const PhotoPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.tumbnailPhoto,
    this.initialIndex,
  }) : super(key: key);

  final int albumId;
  final Photo? tumbnailPhoto;
  final int? initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = photoListViewModelProvider(albumId);

    return UScaffold(
      backgroundColor: Colors.black,
      title: context.localization.photo,
      body: UProvidedStateDecorator<List<Photo>>(
        provider: provider,
        builder: (data, _, __) => _PhotoContent(
          data,
          initialIndex,
        ),
      ),
    );
  }
}

class _PhotoContent extends ConsumerStatefulWidget {
  const _PhotoContent(
    this.photos,
    this.initialIndex, {
    Key? key,
  }) : super(key: key);

  final List<Photo> photos;
  final int? initialIndex;

  @override
  ConsumerState<_PhotoContent> createState() => _PhotoContentState();
}

class _PhotoContentState extends ConsumerState<_PhotoContent> {
  late int index;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    index = widget.initialIndex ?? 0;
    pageController = PageController(initialPage: index);
  }

  void _pageUpdate(int value) {
    setState(() => index = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemBuilder: (_, index) => UNetworkImage(widget.photos[index].url),
            itemCount: widget.photos.length,
            onPageChanged: _pageUpdate,
          ),
        ),
        const SizedBox(height: 20),
        UCard(
          child: Text(widget.photos[index].title),
        ),
      ],
    );
  }
}
