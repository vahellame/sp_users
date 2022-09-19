import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';

final albumListViewModelProvider = MultiDataViewModelProviderFamily<AlbumListViewModel, Album, int>(
  (ref, userId) => AlbumListViewModel(
    ref.read<AlbumRepository>(albumRepositoryProvider),
    userId,
  ),
);

const Pagination _pagination = Pagination();

class AlbumListViewModel extends MultiDataViewModel<Album> {
  AlbumListViewModel(
    this._albumRepository,
    this.userId,
  );

  final AlbumRepository _albumRepository;
  final int userId;

  @override
  Future<void> reload() {
    return loadData(
      () => _albumRepository.getAlbums(userId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _albumRepository.getAlbums(userId, pagination: pagination),
    );
  }
}
