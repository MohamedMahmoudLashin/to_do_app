import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/features/auth/presentation/ui_screens/signin_screen.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformffield.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   final TextEditingController _emailController = TextEditingController();

   final TextEditingController _fullNameController = TextEditingController();

   final TextEditingController _passwordController = TextEditingController();

   final TextEditingController _confirmPasswordController = TextEditingController();

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
                SizedBox(height: 120.h),
                CustomTextformffield(hint: "email".tr(), label: "email".tr(),controller: _emailController,),
                SizedBox(height: 20.h),
                CustomTextformffield(hint: "fullName".tr(), label: "fullName".tr(),controller: _fullNameController,),
                SizedBox(height: 20.h),
                CustomTextformffield(hint: "password".tr(), label: "password".tr(),obscureText: true,controller: _passwordController,),
               SizedBox(height: 20.h),
                CustomTextformffield(hint: "confPass".tr(), label: "confPass".tr(),obscureText: true,controller: _confirmPasswordController,),
               SizedBox(height: 20.h),
                CustomButton(press: (){

                }, text: "SignUp".tr()),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("haveAnAccount".tr(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.kGrey),),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>SignInScreen())
                    );
                      }, child:Text("signIn".tr(),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
