import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/view/widgets/custom_button.dart';
import 'package:to_do_app/view/widgets/custom_textformffield.dart';

import '../../core/app_color.dart';
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
              CustomTextformffield(hint: "Email", label: "Email"),
              CustomTextformffield(hint: "Full Name", label: "Full Name"),
              CustomTextformffield(hint: "Password", label: "Password",icon: IconButton(onPressed: (){
                setState(() {
                  isShown = !isShown;
                });
              }, icon: Icon(isShown?Icons.vaccines_outlined:Icons.remove_red_eye_outlined))),
              CustomTextformffield(hint: "Confirm Password", label: "Confirm Password",icon: IconButton(onPressed: (){
                setState(() {
                  isShown = !isShown;
                });
              }, icon: Icon(isShown?Icons.vaccines_outlined:Icons.remove_red_eye_outlined))),
              CustomButton(press: (){}, text: "SIGN UP"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Have an account?",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kWhite1),),
                  TextButton(onPressed: (){}, child:Text("Sign in",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                ],
              ),
            ],
          ),
        )
    );
  }
}
