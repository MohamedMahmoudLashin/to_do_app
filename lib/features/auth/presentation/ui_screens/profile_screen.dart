import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../widgets/custom_profile_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColor.kBlack,size: 20,)),
        backgroundColor: AppColor.kWhite,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 30,),
            SvgPicture.asset("assets/rafiki.svg"),
            SizedBox(height: 80.h,),
            CustomProfileRow(title: "name".tr(),press: (){},),
            SizedBox(height: 10,),
            CustomProfileRow(title: "Change Email",press: (){},),
            SizedBox(height: 10,),
            CustomProfileRow(title: "changePass".tr(),press: (){},),
            SizedBox(height: 10,),
            CustomProfileRow(title: "Change Language",press: (){},),
            Row(
              children: [
                TextButton(onPressed: (){}, child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,letterSpacing: 1,color: AppColor.kPurple),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
