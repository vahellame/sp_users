import 'package:sp_users/modules/user/domain/domain.dart';
import 'package:sp_users/modules/user/presentation/presentation.dart';
import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';
import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';

part 'router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: RouteTransition.animation,
  durationInMilliseconds: 500,
  reverseDurationInMilliseconds: 500,
  routes: <AutoRoute>[
    AutoRoute(
      page: UserListPage,
      path: '/users',
      initial: true,
    ),
    AutoRoute(
      page: UserPage,
      path: '/users/:userId',
    ),
    AutoRoute(
      page: AlbumListPage,
      path: '/users/:userId/albums',
    ),
    AutoRoute(
      page: AlbumPage,
      path: '/albums/:albumId',
    ),
    AutoRoute(
      page: PhotoPage,
      path: '/albums/:albumId/view',
    ),
    AutoRoute(
      page: PostListPage,
      path: '/users/:userId/posts',
    ),
    AutoRoute(
      page: PostPage,
      path: '/posts/:postId',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
