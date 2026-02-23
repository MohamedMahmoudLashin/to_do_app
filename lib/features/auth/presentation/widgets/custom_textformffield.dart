import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import '../../../../core/responsive/responsive_extension.dart';

class CustomTextformffield extends StatelessWidget {
  const CustomTextformffield({
    super.key,
    this.controller,
    required this.hint,
    required this.label,
    // this.icon,
    this.obscureText = false,

  });

  final TextEditingController? controller;
  final String hint;
  final String label;
  // final IconButton? icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s'))
      ],
      controller:controller ,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.kGrey,
            width:1
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400,color: AppColor.kGrey),
        labelText: label,
        labelStyle: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400,color: AppColor.kGrey),
        suffixIcon: obscureText == true
            ? const Icon(Icons.visibility_off,color: AppColor.kGrey,)
            : null,      ),
    );
  }
}
