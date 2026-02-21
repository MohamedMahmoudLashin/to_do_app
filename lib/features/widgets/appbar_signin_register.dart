import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';

class AppbarSigninRegister extends StatelessWidget implements PreferredSizeWidget {
  const AppbarSigninRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kWhite,
      actions: [
        GestureDetector(
          onTap: (){
            if (context.locale == Locale('ar')){
              context.setLocale(Locale('en'));
            }else{
              context.setLocale(Locale('ar'));
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text("locale".tr(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColor.kPurple,),),
                Icon(Icons.arrow_forward_ios_rounded,color: AppColor.kPurple,)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
