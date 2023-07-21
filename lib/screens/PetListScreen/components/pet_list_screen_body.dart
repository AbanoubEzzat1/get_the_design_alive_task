import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_the_design_alive_task/constants.dart';
import '../../../models/pet_model.dart';

class PetListBody extends StatefulWidget {
  const PetListBody({Key? key}) : super(key: key);

  @override
  State<PetListBody> createState() => _PetListBodyState();
}

class _PetListBodyState extends State<PetListBody> {
  @override
  Widget build(BuildContext context) {
    return petListBody();
  }
}

//Pet List Body
Padding petListBody() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          searchTextFormField(),
          petListView(),
        ],
      ),
    );

//Pet ListView
Widget petListView() => Expanded(
      child: Container(
        color: mainColor,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: petList.length,
          itemBuilder: (context, index) {
            Pet pet = petList[index];
            return listViewItemBulider(pet: pet);
          },
        ),
      ),
    );
Widget listViewItemBulider({Pet? pet}) => Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
    child: listViewItem(pet: pet));

Widget listViewItem({Pet? pet}) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0.r),
      ),
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: listViewItemData(pet: pet)),
    );

Widget listViewItemData({Pet? pet}) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        petImage(pet: pet),
        SizedBox(width: 8.w),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              petCategory(pet: pet),
              petType(pet: pet),
              petLoveCount(pet: pet),
            ],
          ),
        ),
      ],
    );

Widget petImage({Pet? pet}) => CachedNetworkImage(
      imageUrl: pet!.petPic,
      placeholder: (context, url) => const SizedBox(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: 115.68.w,
      height: 112.22.h,
      fit: BoxFit.cover,
    );

Widget petCategory({Pet? pet}) => Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Text(
        pet!.petCategory,
        style: TextStyle(
          fontFamily: "BalsamiqSans",
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
          color: textBlack,
        ),
      ),
    );

Widget petType({Pet? pet}) => Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Text(
        pet!.petType,
        style: TextStyle(
          fontFamily: "BalsamiqSans",
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
          color: mainColor,
        ),
      ),
    );

Widget petLoveCount({Pet? pet}) => Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        children: [
          Image.asset(
            "assets/images/pawprintImg.png",
            width: 25.91.w,
            height: 28.06.h,
          ),
          SizedBox(width: 5.w),
          Text(
            'Love Count: ${pet!.petLoveCount}',
            style: TextStyle(
              fontFamily: "BalsamiqSans",
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              color: orange,
            ),
          ),
        ],
      ),
    );

//Search TextForm Field
Padding searchTextFormField() => Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Container(
        height: 41.h,
        width: 369.w,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: textFormField(),
      ),
    );

TextFormField textFormField() => TextFormField(
      decoration: InputDecoration(
        hintText: 'Search by pet type',
        icon: searchTextFormFieldIconImage(),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        border: InputBorder.none,
      ),
    );

Padding searchTextFormFieldIconImage() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Image.asset("assets/images/magnifier 1.png"),
    );
