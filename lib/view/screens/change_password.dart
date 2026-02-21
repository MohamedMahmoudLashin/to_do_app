import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/view/widgets/custom_button.dart';
import 'package:to_do_app/view/widgets/custom_textformffield.dart';

import '../../core/theme/app_color.dart';
import '../widgets/appbar_signin_register.dart';

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
              CustomTextformffield(hint: "Password", label: "Password"),
              CustomTextformffield(hint: "Confirm Password", label: "Confirm Password"),
              CustomButton(press: (){}, text: "CHANGE PASSWORD"),
            ],
          ),
        )
    );
  }
}
