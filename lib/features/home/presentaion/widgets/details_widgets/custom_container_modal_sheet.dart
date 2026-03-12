import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/home/data/models/todo_model.dart';
import 'package:to_do_app/features/home/data/models/todo_param.dart';
import 'package:to_do_app/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_button_modal_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/home_widgets/custom_modal_text_form_field.dart';
import '../../../../../core/responsive/responsive_extension.dart';
import '../../../../../core/theme/app_color.dart';

class CustomEditContainerModalSheet extends StatefulWidget {

   CustomEditContainerModalSheet({super.key, required this.todo,
     });
   final TodoModel todo;

  @override
  State<CustomEditContainerModalSheet> createState() => _CustomContainerModalSheetState();
}

class _CustomContainerModalSheetState extends State<CustomEditContainerModalSheet> {
  final TextEditingController titleController =TextEditingController() ;
  final TextEditingController descriptionController=TextEditingController() ;
  final TextEditingController deadLineController=TextEditingController() ;
  final TextEditingController addImageController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          color: AppColor.kPurple1
      ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(30.sp)
                  ),
                ),
              ),
              CustomModalTextFormField(title: "title".tr(),maxLines: 1,textIconBorder: AppColor.kWhite,controller: titleController,),
              SizedBox(height: 20.h,),
              CustomModalTextFormField(title: "description".tr(),maxLines: 15,textIconBorder: AppColor.kWhite,controller: descriptionController,),
              SizedBox(height: 20.h,),
              CustomModalTextFormField(
                onTap: () async {
                  var picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    var formatted = DateFormat('dd MMMM yyyy').format(picked);
                    setState(() {
                     deadLineController.text = formatted;
                    });
                  }
                },
                title: "deadline(Optional)".tr(),readOnly:true,maxLines: 1,textIconBorder: AppColor.lightPink,icon: Icon(Icons.calendar_today_outlined,color:AppColor.lightPink,),controller:  deadLineController,),
              SizedBox(height: 20.h,),
              CustomModalTextFormField(onTap:()async{
                var imagePicker = ImagePicker();
                var image = await imagePicker.pickImage(source: ImageSource.gallery);
                if(image !=null){
                  File(image.path);
                  setState(() {
                  });
                }
              }
                ,title: "addImage(Optional)".tr(),maxLines: 1,readOnly:true,textIconBorder: AppColor.lightPink,icon: Icon(Icons.image_outlined,color:AppColor.lightPink),controller: addImageController,),
              SizedBox(height: 20.h,),
              CustomButtonModalSheet(press: (){
                context.read<HomeCubit>().createTodo(TodoParam(title: titleController.text , des:descriptionController.text,deadline: deadLineController.text,));
                Navigator.of(context).pop();
              }, text:"edittodo".tr())
            ],
          ),
        ),
      ),
    );
  }
}
