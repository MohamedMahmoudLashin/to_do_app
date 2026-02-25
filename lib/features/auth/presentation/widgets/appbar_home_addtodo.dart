import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';

class AppbarHomeAddtodo extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeAddtodo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsetsGeometry.symmetric(horizontal: 15.h),
      leading: SvgPicture.asset("assets/logo_icon.svg",),
      leadingWidth: 35.h,
      pa
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.person_2_outlined,size: 30.h,))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
