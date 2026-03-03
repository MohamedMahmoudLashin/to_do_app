import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/profile/presentation/proffile_cubit/profile_cubit.dart';
import '../widgets/custom_profile_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColor.kBlack,size: 20,)),
        backgroundColor: AppColor.kWhite,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 30,),
            SvgPicture.asset("assets/rafiki.svg"),
            SizedBox(height: 80.h,),
            CustomProfileRow(title: "name".tr(),press: (){},),
            SizedBox(height: 20.h,),
            CustomProfileRow(title: "changeEmail".tr(),press: (){},),
            SizedBox(height: 20.h,),
            CustomProfileRow(title: "changePass".tr(),press: (){},),
            SizedBox(height: 20.h,),
            CustomProfileRow(title: "changeLang".tr(),press: (){

            },),
            SizedBox(height: 20.h,),
            Row(
              children: [
                BlocConsumer<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              if (state is ProfileSignOutSuccess){
                               Navigator.of(context).pushNamedAndRemoveUntil("signin",(route)=>false);
                              }
                            },
                            builder: (context, state) {
                              if (state is ProfileSignOutLoading){
                                return CircularProgressIndicator();
                              }
                              return TextButton(
                    onPressed: (){  context.read<ProfileCubit>().signOut();
                    }, child: Text("logout".tr(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,letterSpacing: 1,color: AppColor.kPurple),));
                            },
                          ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
