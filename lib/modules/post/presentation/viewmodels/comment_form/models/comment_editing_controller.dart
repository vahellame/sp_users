import 'package:sp_users/modules/post/presentation/presentation.dart';

@immutable
class CommentEditingController {
  CommentEditingController({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? textController,
  })  : nameController = nameController ?? TextEditingController(),
        emailController = emailController ?? TextEditingController(),
        textController = textController ?? TextEditingController();

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController textController;

  void clear() {
    nameController.clear();
    emailController.clear();
    textController.clear();
  }
}
