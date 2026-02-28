import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
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

   GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
  listener: (context, state) {
    print("Bloc State: $state");
    if (state is AuthRegisterSuccess){
      Navigator.of(context).pushReplacementNamed("home");
    }
    if (state is AuthRegisterError){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text(state.message)))
      );
    }
    // TODO: implement listener
  },
  child: Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppbarSigninRegister(),
        body:Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    SvgPicture.asset("assets/logo.svg"),
                    SizedBox(height: 120.h),
                    CustomTextformffield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter email";
                        }
                        final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return "please enter valid email";
                        }
                        return null;
                      },
                      // validator: (value){
                      //   if (value==null|| !value.contains('.com')||!value.contains('@')||value.isEmpty) {
                      //     return "please enter valid email";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      hint: "email".tr(), label: "email".tr(),controller: _emailController,),
                    SizedBox(height: 20.h),
                    CustomTextformffield(
                      validator: (value){
                        if (value ==null||value.trim().isEmpty){
                          return "please enter valid name";
                        }
                        else{
                          return null;
                        }
                      },
                      hint: "fullName".tr(), label: "fullName".tr(),controller: _fullNameController,),
                    SizedBox(height: 20.h),
                    CustomTextformffield(
                      validator: (value){
                        if (value==null || value.length<8){
                          return "please enter valid password";
                        }
                        else{
                          return null;
                        }
                      },
                      hint: "password".tr(), label: "password".tr(),obscureText: true,controller: _passwordController,),
                   SizedBox(height: 20.h),
                    CustomTextformffield(
                      validator: (value){
                        if(value != _passwordController.text||value == null || value.isEmpty){
                          return "Passwords do not match";
                        }
                        else{
                          return null;
                        }
                      },
                      hint: "confirm Password".tr(), label: "confirm Password".tr(),obscureText: true,controller: _confirmPasswordController,),
                   SizedBox(height: 20.h),
                    CustomButton(press: (){
                      if(formkey.currentState!.validate()){
                        print(formkey.currentState!.validate());
                        print("================Button pressed ✅");
                        context.read<AuthCubit>().createUser(
                        _emailController.text,_passwordController.text,"");
                      }
                      print("===================================");
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
            ),
          ),
        )
    ),
);
  }
}
