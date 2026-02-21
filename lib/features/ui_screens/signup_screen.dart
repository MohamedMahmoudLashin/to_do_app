import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/features/ui_screens/change_password.dart';
import '../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  bool isShown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppbarSigninRegister(),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: 90.h),
                SvgPicture.asset("assets/logo.svg"),
                SizedBox(height: 50.h),
                CustomTextformffield(hint: "email".tr(), label: "email".tr()),
                SizedBox(height: 25.h),
                CustomTextformffield(hint: "fullName".tr(), label: "fullName".tr()),
                SizedBox(height: 25.h),
                CustomTextformffield(hint: "password".tr(), label: "password".tr(),obscureText: true,),
               SizedBox(height: 25.h),
                CustomTextformffield(hint: "confPass".tr(), label: "confPass".tr(),obscureText: true,),
               SizedBox(height: 25.h),
                CustomButton(press: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>SignInScreen())
                  );
                }, text: "SignUp".tr()),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("haveAnAccount".tr(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kBlack),),
                    TextButton(onPressed: (){}, child:Text("signIn".tr(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
