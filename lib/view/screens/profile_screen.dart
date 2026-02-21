import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/view/widgets/custom_profile_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
      ),
      body: Column(
        children: [
          SvgPicture.asset("assets/rafiki.svg"),
          CustomProfileRow(title: "Name",press: (){},),
          CustomProfileRow(title: "Change Email",press: (){},),
          CustomProfileRow(title: "Change Password",press: (){},),
          CustomProfileRow(title: "Change Language",press: (){},),
          TextButton(onPressed: (){}, child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,letterSpacing: 1,color: AppColor.kPurple),))
        ],
      ),
    );
  }
}
