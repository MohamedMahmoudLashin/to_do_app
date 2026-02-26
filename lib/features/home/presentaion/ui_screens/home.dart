import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/responsive/responsive_extension.dart';
import 'package:to_do_app/core/theme/app_color.dart';
import 'package:to_do_app/features/home/presentaion/widgets/custom_container_add.dart';

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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25.h,vertical: 60.h),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 20.h,),
          itemCount: tasks.length,
          itemBuilder: (context,index){
            return CustomContainerAdd(
                title: tasks[index]['title']!,
                description:tasks[index]['description']! ,
                date:tasks[index]['date']!,
                isPrimary: index==0
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(right: 20.h,bottom: 30.h),
        child: Column(
          spacing: 10.h,
          mainAxisSize:MainAxisSize.min ,
          mainAxisAlignment: .end,
          children: [
            FloatingActionButton(
              heroTag: "drawnTag",
                backgroundColor: AppColor.kPurple,
                onPressed: (){
                  setState(() {
                    tasks.add({
                      "title": "",
                      "description": "",
                      "date": "",
                    });
                  });
                },
            child: const Icon(Icons.draw,color: AppColor.kWhite,),),
            FloatingActionButton(
              heroTag: "addTask",
              backgroundColor: AppColor.kPurple,
              onPressed: (){
                setState(() {
                  tasks.add({
                    "title": "New Task",
                    "description": "This is a new task",
                    "date": "Created now",
                  });
                });
              },
              child: const Icon(Icons.add,color: AppColor.kWhite,),)
          ],
        ),
      ));

  }
}
