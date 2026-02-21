import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    required this.press,
    required this.text});
  
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColor.kPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child:TextButton(onPressed: (){},
          child: Text(text,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColor.kWhite),)) ,
    );
  }
}
