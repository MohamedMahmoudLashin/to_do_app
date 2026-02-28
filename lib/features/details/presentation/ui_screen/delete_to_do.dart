import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/features/details/presentation/widgets/custom_button_dtails.dart';
import '../../../../core/responsive/responsive_extension.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/appbar_details_delete.dart';

class DeleteToDo extends StatefulWidget {
  const DeleteToDo({super.key});

  @override
  State<DeleteToDo> createState() => _DeleteToDoState();
}

class _DeleteToDoState extends State<DeleteToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarDetailsDelete(),
        body: Column(
          children: [

            CustomButtonDetails(press: (){}, text: "text", color: AppColor.kPurple1),
            SizedBox(height: 20.h,),
            CustomButtonDetails(press: (){}, text: "text", color: AppColor.kGreen),
          ],
        )
    );
  }
}
