import 'package:sp_users/core/presentation/presentation.dart';

class UDialogTitle extends StatelessWidget {
  const UDialogTitle(
    this.data, {
    this.iconData,
    Key? key,
  }) : super(key: key);

  final String data;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (iconData != null) ...[
          UIconBox(
            iconData!,
            size: 25,
            padding: DesignConstants.padding,
          ),
          const SizedBox(height: 10),
        ],
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 20,
          ),
          child: Text(
            data,
            style: context.textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
