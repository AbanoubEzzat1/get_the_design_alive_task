import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_the_design_alive_task/constants.dart';
import 'package:get_the_design_alive_task/screens/PetListScreen/components/pet_list_screen_body.dart';

class PetListScreen extends StatelessWidget {
  const PetListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: _appBar(),
        backgroundColor: textWhite,
        body: const PetListBody(),
      ),
    );
  }
}

PreferredSizeWidget _appBar() {
  return PreferredSize(
    preferredSize: Size(390.0.w, 86.0.h),
    child: Container(
      color: Colors.red,
      width: 390.w,
      height: 86.h,
      child: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        title: appBarTitle(),
      ),
    ),
  );
}

Widget appBarTitle() => Text(
      "Pet Market",
      style: TextStyle(
        fontSize: 30.sp,
        fontFamily: "BalsamiqSans",
        fontWeight: FontWeight.w400,
        color: textBlack,
      ),
    );
