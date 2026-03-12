import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/widgets/details_widgets/custom_text_details.dart';

import '../../../../core/responsive/responsive_extension.dart';
import '../../data/models/todo_model.dart';
import '../widgets/details_widgets/appbar_details_delete.dart';
import '../widgets/details_widgets/custom_title_text_details.dart';

class DetailTodo extends StatelessWidget {
  const DetailTodo({super.key, required this.todo});
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppbarDetailsDelete(todo: todo,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:27.h,horizontal: 27.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomTextTitleDetails(title:todo.title),
              SizedBox(height: 19.h,),
              CustomTextDetails(title: todo.des)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding:  EdgeInsets.only(bottom:40.h),
              child: CustomTextDetails(title: "Created at ${todo.deadline}")
            ),
          ],
        ),
      ),
    );
  }
}
