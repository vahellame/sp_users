import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/infrastructure/infrastructure.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

final postViewModelProvider = SingleDataViewModelProviderWithModelValue<PostViewModel, Post>(
  (ref, value) => PostViewModel(
    value,
    ref.read<PostRepository>(postRepositoryProvider),
  ),
);

class PostViewModel extends SingleDataViewModel<Post> {
  PostViewModel(
    ModelValue<Post> postValue,
    this._postRepository,
  ) : super(postValue);

  final PostRepository _postRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _postRepository.getPostById(id));
  }
}
