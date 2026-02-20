import 'package:flutter/material.dart';
import 'package:to_do_app/core/app_color.dart';

import '../widgets/appbar_details_delete.dart';

class DetailTodo extends StatefulWidget {
  const DetailTodo({super.key});

  @override
  State<DetailTodo> createState() => _DetailTodoState();
}

class _DetailTodoState extends State<DetailTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppbarDetailsDelete(),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: Container(
        child: Text("Created at 1 Sept 2021",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.kBlack),),
      ),
    );
  }
}
