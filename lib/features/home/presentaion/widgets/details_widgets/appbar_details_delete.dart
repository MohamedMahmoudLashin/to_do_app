import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/widgets/details_widgets/custom_edit_container_modal_sheet.dart';
import '../../../data/models/todo_model.dart';
import '../../home_cubit/home_cubit.dart';
import '../../ui_screens/detail_todo.dart';

class AppbarDetailsDelete extends StatefulWidget
    implements PreferredSizeWidget {
  const AppbarDetailsDelete({super.key, required this.todo});

  final TodoModel todo;

  @override
  State<AppbarDetailsDelete> createState() => _AppbarDetailsDeleteState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarDetailsDeleteState extends State<AppbarDetailsDelete> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController deadLineController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    deadLineController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todo = widget.todo;

    return AppBar(
      backgroundColor: AppColor.kWhite,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: [
        SvgPicture.asset("assets/clock.svg"),
        SizedBox(width: 10.w),

        /// ✏️ Edit
        GestureDetector(
          onTap: () {
            titleController.text = todo.title;
            desController.text = todo.des;
            deadLineController.text = todo.deadline ?? "";
            imageController.text = todo.image ?? "";

            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return CustomEditContainerModalSheet(
                  todo: todo,
                  titleController: titleController,
                  descriptionController: desController,
                  deadLineController: deadLineController,
                  addImageController: imageController,
                );
              },
            ).then((value) {
              context.read<HomeCubit>().getTodo().then(
                (value) {
                  setState(() {
                  });
                },
              );

            });
          },
          child: SvgPicture.asset("assets/edit-2.svg"),
        ),

        SizedBox(width: 10.w),

        /// 🗑 Delete
        Padding(
          padding: EdgeInsetsDirectional.only(start: 1.w, end: 27.w),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("deletetodo".tr()),
                    content: Text("warn".tr()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("cancel".tr()),
                      ),
                      TextButton(
                        onPressed: () async {
                          await context
                              .read<HomeCubit>()
                              .deleteTodo(todo.id);

                          Navigator.pop(context); // dialog
                          Navigator.pop(context); // screen

                          context.read<HomeCubit>().getTodo();
                        },
                        child: Text("delete".tr()),
                      ),
                    ],
                  );
                },
              );
            },
            child: SvgPicture.asset("assets/trash-2.svg"),
          ),
        ),
      ],
    );
  }
}
