import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_button_modal_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_container_add.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_modal_text_form_field.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';

class CustomContainerModalSheet extends StatefulWidget {
  final TextEditingController titleController ;
  final TextEditingController descriptionController ;
  final TextEditingController deadLineController ;
  final TextEditingController addImageController ;
   CustomContainerModalSheet({super.key,
     required this.titleController,
     required this.descriptionController,
     required this.deadLineController,
     required this.addImageController});

  @override
  State<CustomContainerModalSheet> createState() => _CustomContainerModalSheetState();
}

class _CustomContainerModalSheetState extends State<CustomContainerModalSheet> {


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
              CustomModalTextFormField(title: "title".tr(),maxLines: 1,textIconBorder: AppColor.kWhite,controller: widget.titleController,),
              SizedBox(height: 20.h,),
              CustomModalTextFormField(title: "description".tr(),maxLines: 15,textIconBorder: AppColor.kWhite,controller:  widget.descriptionController,),
              SizedBox(height: 20.h,),
              CustomModalTextFormField(
                onTap: () async {
                  var picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    String formatted = DateFormat('dd MMMM yyyy').format(picked);
                    setState(() {
                      widget.deadLineController.text = formatted;
                    });
                  }
                },
                title: "deadline(Optional)".tr(),readOnly:true,maxLines: 1,textIconBorder: AppColor.lightPink,icon: Icon(Icons.calendar_today_outlined,color:AppColor.lightPink,),controller:  widget.deadLineController,),
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
                ,title: "addImage(Optional)".tr(),maxLines: 1,readOnly:true,textIconBorder: AppColor.lightPink,icon: Icon(Icons.image_outlined,color:AppColor.lightPink),controller:  widget.addImageController,),
              SizedBox(height: 20.h,),
              CustomButtonModalSheet(press: (){
                Navigator.of(context).pop();
              }, text: "addToDo".tr())
            ],
          ),
        ),
      ),
    );
  }
}
