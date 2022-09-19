import 'package:sp_users/modules/user/presentation/presentation.dart';
import 'package:sp_users/modules/user/domain/domain.dart';

class UUserListItem extends StatelessWidget {
  const UUserListItem(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UIconBox(FeatherIcons.user),
      title: Text(user.name, maxLines: 1),
      subtitle: Text("@${user.username}", maxLines: 1),
      onTap: () => context.navigateTo(
        UserRoute(userId: user.id, user: user),
      ),
    );
  }
}

class UCustomUserListItem extends StatelessWidget {
  const UCustomUserListItem(
    this.name,
    this.username, {
    Key? key,
  }) : super(key: key);

  final String name;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UIconBox(FeatherIcons.user),
      title: Text(name, maxLines: 1),
      subtitle: Text(username, maxLines: 1),
    );
  }
}
