import 'package:sp_users/modules/user/presentation/presentation.dart';
import 'package:sp_users/modules/user/domain/domain.dart';

class UCompanyInfoDialog extends StatelessWidget {
  const UCompanyInfoDialog(
    this.company, {
    Key? key,
  }) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UDialogTitle(
          context.localization.company,
          iconData: FeatherIcons.home,
        ),
        Text(
          company.name,
          style: context.textTheme.subtitle1,
        ),
        Text(
          company.bs,
          style: context.textTheme.subtitle1,
        ),
        const SizedBox(height: 20),
        Text(
          company.catchPhrase,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
