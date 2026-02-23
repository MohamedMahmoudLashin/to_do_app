import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarHomeAddtodo extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeAddtodo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset("assets/logo_icon.svg"),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.person_2_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
