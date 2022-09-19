import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

final postListViewModelProvider = MultiDataViewModelProviderFamily<PostListViewModel, Post, int>(
  (ref, userId) => PostListViewModel(
    ref.read<PostRepository>(postRepositoryProvider),
    userId,
  ),
);

const Pagination _pagination = Pagination();

class PostListViewModel extends MultiDataViewModel<Post> {
  PostListViewModel(
    this._postRepository,
    this.userId,
  );

  final PostRepository _postRepository;
  final int userId;

  @override
  Future<void> reload() {
    return loadData(
      () => _postRepository.getPosts(userId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _postRepository.getPosts(userId, pagination: pagination),
    );
  }
}
