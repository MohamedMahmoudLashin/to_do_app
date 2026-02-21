import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: Column(
            children: [
              SvgPicture.asset("assets/logo.svg"),
              CustomTextformffield(hint: "password".tr(), label: "password".tr()),
              CustomTextformffield(hint: "confPass".tr(), label:"confPass".tr() ),
              CustomButton(press: (){}, text: "changePass".tr()),
            ],
          ),
        )
    );
  }
}
