import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

final commentListViewModelProvider = MultiDataViewModelProviderFamily<CommentListViewModel, Comment, int>(
  (ref, postId) => CommentListViewModel(
    ref.read<CommentRepository>(commentRepositoryProvider),
    postId,
  ),
);

const Pagination _pagination = Pagination();

class CommentListViewModel extends MultiDataViewModel<Comment> {
  CommentListViewModel(
    this._commentRepository,
    this.postId,
  );

  final CommentRepository _commentRepository;
  final int postId;

  @override
  Future<void> reload() {
    return loadData(
      () => _commentRepository.getComments(postId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _commentRepository.getComments(postId, pagination: pagination),
    );
  }

  void addCommentFromMemory(Comment comment) {
    assert(state is DataStateLoaded);

    state = DataState.loaded(
      data: [comment, ...state.data!],
    );
  }
}
