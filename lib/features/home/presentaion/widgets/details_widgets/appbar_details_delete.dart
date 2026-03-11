import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_container_modal_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_modal_text_form_field.dart';

import '../../home_cubit/home_cubit.dart';

class AppbarDetailsDelete extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarDetailsDelete({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset("assets/clock.svg"),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder: (context){
              return CustomContainerModalSheet(addImageController: title,deadLineController: title,descriptionController: title,titleController: title,);
            });
                },
          child: SvgPicture.asset("assets/edit-2.svg"),
        ),
        SizedBox(width: 10.w),
        Padding(
          padding: EdgeInsets.only(right: 27.w),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Delete Todo"),
                    content: Text("Are you sure you want to delete this task?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel",style: TextStyle(color: AppColor.kBlack)),
                      ),
                      BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    ////////////////////////////////////////////////////////////////////////
  },
  builder: (context, state) {
    return TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Delete",style: TextStyle(color: AppColor.kPurple),),
                      );
  },
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
