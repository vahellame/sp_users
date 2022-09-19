import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';

final photoListViewModelProvider = MultiDataViewModelProviderFamily<PhotoListViewModel, Photo, int>(
  (ref, albumId) => PhotoListViewModel(
    ref.read<PhotoRepository>(photoRepositoryProvider),
    albumId,
  ),
);

const Pagination _pagination = Pagination();

class PhotoListViewModel extends MultiDataViewModel<Photo> {
  PhotoListViewModel(
    this._photoRepository,
    this.albumId,
  );

  final PhotoRepository _photoRepository;
  final int albumId;

  @override
  Future<void> reload() {
    return loadData(
      () => _photoRepository.getPhotos(albumId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _photoRepository.getPhotos(albumId, pagination: pagination),
    );
  }
}
