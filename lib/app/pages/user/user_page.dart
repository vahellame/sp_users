import 'package:sp_users/modules/photo/domain/domain.dart';
import 'package:sp_users/modules/photo/presentation/presentation.dart';
import 'package:sp_users/modules/post/domain/domain.dart';
import 'package:sp_users/modules/post/presentation/presentation.dart';
import 'package:sp_users/modules/user/domain/domain.dart';
import 'package:sp_users/modules/user/presentation/presentation.dart';

class UserPage extends StatelessWidget {
  const UserPage(
    @PathParam('userId') this.userId, {
    Key? key,
    this.user,
  }) : super(key: key);

  final int userId;
  final User? user;

  @override
  Widget build(BuildContext context) {
    final provider = userViewModelProvider(
      ModelValue(
        id: userId,
        cachedModel: user,
      ),
    );

    return UProvidedBuilder<User>(
      provider: provider,
      builder: (state, ref) {
        return UScaffold(
          backgroundColor: Colors.black,
          title: _getTitle(context, state),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
            child: UStateDecorator<User>(
              state: state,
              builder: (data, _) => _UserContent(data),
            ),
          ),
        );
      },
    );
  }

  String _getTitle(BuildContext context, DataState<User> state) {
    if (state.isNotEmpty) {
      return "@${state.data!.username}";
    }

    return context.localization.profile;
  }
}

class _UserContent extends StatelessWidget {
  const _UserContent(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _UserHeader(user),
        const SizedBox(height: 15),
        _UserInformation(user),
        const SizedBox(height: 15),
        _UserAlbums(user),
        const SizedBox(height: 15),
        _UserPosts(user),
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return UCard(
      color: Colors.black,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const UIconBox(
            FeatherIcons.user,
            color: Colors.white,
            iconColor: Colors.black,
            size: 35,
            padding: EdgeInsets.all(15),
          ),
          const SizedBox(height: 20),
          Text(
            user.name,
            style: context.theme.textTheme.headline6!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'userListPage',
      child: UCard(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            ListTile(
              leading: const UIconBox(FeatherIcons.mail),
              title: Text(context.localization.email),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.phone),
              title: Text(context.localization.phone),
              subtitle: Text(user.phone),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.globe),
              title: Text(context.localization.website),
              subtitle: Text(user.website),
              trailing: const Icon(FeatherIcons.chevronRight),
              onTap: () => launchUrl(user.website),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.home),
              title: Text(context.localization.company),
              subtitle: Text(user.company.name),
              trailing: const Icon(FeatherIcons.chevronRight),
              onTap: () => UDialog.show(
                context,
                UCompanyInfoDialog(user.company),
              ),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.mapPin),
              title: Text(context.localization.address),
              subtitle: Text(formatAddress(user.address)),
              trailing: const Icon(FeatherIcons.map),
              onTap: () => launchMapsUrl(user.address.geo),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAlbums extends StatelessWidget {
  const _UserAlbums(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "albumsPage",
      child: UCard(
        padding: EdgeInsets.zero,
        child: UProvidedStateDecorator<List<Album>>(
          provider: albumListViewModelProvider(user.id),
          builder: (data, failure, ref) {
            return Column(
              children: [
                ListTile(
                  title: Text(context.localization.albums),
                  trailing: const Icon(FeatherIcons.chevronRight),
                  onTap: () => context.navigateTo(AlbumListRoute(userId: user.id)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => UAlbumListItem(data[index]),
                  itemCount: data.length < 3 ? data.length : 3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _UserPosts extends StatelessWidget {
  const _UserPosts(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "postsPage",
      child: UCard(
        padding: EdgeInsets.zero,
        child: UProvidedStateDecorator<List<Post>>(
          provider: postListViewModelProvider(user.id),
          builder: (data, failure, ref) {
            return Column(
              children: [
                ListTile(
                  title: Text(context.localization.posts),
                  trailing: const Icon(FeatherIcons.chevronRight),
                  onTap: () => context.navigateTo(PostListRoute(userId: user.id)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => UPostListItem(data[index]),
                  itemCount: data.length < 3 ? data.length : 3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
