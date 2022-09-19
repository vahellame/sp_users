import 'package:sp_users/core/presentation/presentation.dart';

class UInputDecoration extends InputDecoration {
  UInputDecoration({
    String? hintText,
  }) : super(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: DesignConstants.borderRadiusMini,
            gapPadding: 0,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: DesignConstants.padding,
          isDense: true,
          isCollapsed: true,
        );
}
