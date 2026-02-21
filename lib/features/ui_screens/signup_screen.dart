import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: Column(
            children: [
              SvgPicture.asset("assets/logo.svg"),
              CustomTextformffield(hint: "email".tr(), label: "email".tr()),
              CustomTextformffield(hint: "fullName".tr(), label: "fullName".tr()),
              CustomTextformffield(hint: "password".tr(), label: "password".tr()),
              CustomTextformffield(hint: "confPass".tr(), label: "confPass".tr()),
              CustomButton(press: (){}, text: "SignUp".tr()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("haveAnAccount".tr(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kWhite1),),
                  TextButton(onPressed: (){}, child:Text("signIn".tr(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                ],
              ),
            ],
          ),
        )
    );
  }
}
