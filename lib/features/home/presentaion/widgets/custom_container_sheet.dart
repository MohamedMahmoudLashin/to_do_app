import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_button_sheet.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_text_field.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';

class CustomContainerSheet extends StatefulWidget {
  const CustomContainerSheet({super.key});

  @override
  State<CustomContainerSheet> createState() => _CustomContainerSheetState();
}

class _CustomContainerSheetState extends State<CustomContainerSheet> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadLineController = TextEditingController();
  final TextEditingController addImageController = TextEditingController();
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
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(30.sp)
                  ),
                ),
              ),
              CustomTextField(title: "title",maxLines: 1,textIconBorder: AppColor.kWhite,controller: titleController,),
              SizedBox(height: 20.h,),
              CustomTextField(title: "Description",maxLines: 15,textIconBorder: AppColor.kWhite,controller: descriptionController,),
              SizedBox(height: 20.h,),
              CustomTextField(
                onTap: () async {
                  var picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    String formatted = DateFormat('dd MMMM yyyy').format(picked);
                    setState(() {
                      deadLineController.text = formatted;
                    });
                  }
                },
                title: "Deadline (Optional)",readOnly:true,maxLines: 1,textIconBorder: AppColor.lightPink,icon: Icon(Icons.calendar_today_outlined,color:AppColor.lightPink,),controller: deadLineController,),
              SizedBox(height: 20.h,),
              CustomTextField(onTap:()async{
                var imagePicker = ImagePicker();
                var image = await imagePicker.pickImage(source: ImageSource.gallery);
                if(image !=null){
                  File(image.path);
                  setState(() {
                  });
                }
              }
                ,title: "Add Image (Optional)",maxLines: 1,readOnly:true,textIconBorder: AppColor.lightPink,icon: Icon(Icons.image_outlined,color:AppColor.lightPink),controller: addImageController,),
              SizedBox(height: 20.h,),
              CustomButtonSheet(press: (){}, text: "ADD TODO")
            ],
          ),
        ),
      ),
    );
  }
}
