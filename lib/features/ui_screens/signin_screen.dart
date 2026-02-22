import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/features/ui_screens/change_password.dart';
import '../../core/responsive/responsive_extension.dart';
import '../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhite,
      appBar: AppbarSigninRegister(),
      body:Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 70.h),
              SvgPicture.asset("assets/logo.svg"),
              SizedBox(height: 140.h),
              CustomTextformffield(hint: "email".tr(), label: "email".tr(),),
              SizedBox(height: 25.h),
              CustomTextformffield(hint: "password".tr(), label: "password".tr(),obscureText: true,),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child:Text("forgPass".tr(),style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400,color: AppColor.kGrey),))
                ],
              ),
              SizedBox(height: 5.h),
              CustomButton(press: (){}, text: "signIn".tr()),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("dontHaveAnAccount".tr(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.kGrey),),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ChangePassword())
                    );
                  }, child:Text("SignUp".tr(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
