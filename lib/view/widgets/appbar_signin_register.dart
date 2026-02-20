import 'package:flutter/material.dart';
import 'package:to_do_app/core/app_color.dart';

class AppbarSigninRegister extends StatelessWidget implements PreferredSizeWidget {
  const AppbarSigninRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kWhite,
      title: Text("Eng",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColor.kPurple,),),
      actions: [
        IconButton(onPressed: (){},
            icon:Icon(Icons.arrow_forward_ios,color: AppColor.kPurple,) )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
