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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset("assets/logo.svg"),
              CustomTextformffield(hint: "Email", label: "Email",obscureText: false,),
              CustomTextformffield(hint: "Password", label: "Password",),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child:Text("Forgot Password?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.kWhite1),))
                ],
              ),
              CustomButton(press: (){}, text: "SIGN IN"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have an account?",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kBlack),),
                  TextButton(onPressed: (){}, child:Text("Sign up",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: AppColor.kPurple),))
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
