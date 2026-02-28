import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_container_sheet.dart';

import '../widgets/appbar_home_addtodo.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  List<Map<String,String>>tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: AppColor.kWhite,
        appBar: AppbarHomeAddtodo(),
      body: Column(),
      floatingActionButton:
            FloatingActionButton(
              heroTag: "addTask",
              backgroundColor: AppColor.kPurple,
              onPressed: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context, builder: (context) {
                  return CustomContainerSheet();
                },);
              },
              child: const Icon(Icons.add,color: AppColor.kWhite,),)

      );

  }
}
