import 'package:flutter/material.dart';
import 'package:to_do_app/core/app_color.dart';

class CustomProfileRow extends StatelessWidget {
  const CustomProfileRow({super.key, required this.title, required this.press});

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(onPressed:press , child:Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,letterSpacing: 1,color: AppColor.kBlack),)),
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined))
      ],
    );
  }
}
