import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_color.dart';

import '../widgets/appbar_home_addtodo.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kWhite,
        appBar: AppbarHomeAddtodo(),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
              backgroundColor: AppColor.kPurple,
              onPressed: (){},
          child: const Icon(Icons.draw,color: AppColor.kWhite,),),
          FloatingActionButton(
            backgroundColor: AppColor.kPurple,
            onPressed: (){},
            child: const Icon(Icons.add,color: AppColor.kWhite,),)
        ],
      ));

  }
}
