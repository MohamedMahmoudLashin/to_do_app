import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ChangePassword> {
 // bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppbarSigninRegister(showLeading: true,),
        body:Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 70.h),
                SvgPicture.asset("assets/logo.svg"),
                SizedBox(height: 140.h),
                CustomTextformffield(hint: "password".tr(), label: "password".tr(),obscureText: true,),
                SizedBox(height: 25.h),
                CustomTextformffield(hint: "confPass".tr(), label:"confPass".tr(),obscureText: true, ),
                SizedBox(height: 25.h),
                CustomButton(press: (){}, text: "changePass".tr()),
              ],
            ),
          ),
        )
    );
  }
}
