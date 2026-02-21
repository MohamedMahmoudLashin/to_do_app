import 'package:flutter/material.dart';

class AppbarDetailsDelete extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDetailsDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back_ios_new),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.watch_later_outlined)),
        IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
      ],
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
