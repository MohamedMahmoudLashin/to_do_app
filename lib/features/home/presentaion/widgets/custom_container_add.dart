import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';

class CustomContainerAdd extends StatelessWidget {
  const CustomContainerAdd({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.isPrimary=false
  });

  final String title;
  final String description;
  final String date;
  final bool isPrimary ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.h),
          color: isPrimary ?  AppColor.kPurple:
              AppColor.kPurple1
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.h,vertical: 15.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Text(title,style: TextStyle(fontSize: 20.h,fontWeight: FontWeight.w600,letterSpacing: 1.h,color: AppColor.kWhite),),
                Spacer(),
                const Icon(Icons.access_time_outlined,color: AppColor.kWhite,)
              ],
            ),
            SizedBox(height: 15.h,),
            Text(description,style: TextStyle(fontSize: 17.h,fontWeight: FontWeight.w400,letterSpacing: 1.h,color: AppColor.kWhite.withOpacity(.9)),),
            Spacer(),
            Text(date,style: TextStyle(fontSize: 14.h,fontWeight: FontWeight.w400,color: AppColor.kWhite.withOpacity(.9)),),
          ],
        ),
      ),
    )
;
  }
}
