import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/common/components/gradient_button.dart';
import 'package:protest/common/custom_textfield.dart';
import 'package:protest/models/user_model.dart';
import 'package:protest/screens/auth/profile_image_screen.dart';
import 'package:protest/screens/home/main_screen.dart';

class ProfileCompleteScreen extends StatefulWidget {
  const ProfileCompleteScreen({super.key, required this.phone});

  final String phone;

  @override
  State<ProfileCompleteScreen> createState() => _ProfileCompleteScreenState();
}

class _ProfileCompleteScreenState extends State<ProfileCompleteScreen> {
  File? _image;
  final picker = ImagePicker();
  String? viloyat;

  // String? shahar;
  String? birthday;

  final List<DropdownMenuItem<String>> viloyatDownMenuItems = [
    'Namangan',
    'Fargo\'na',
    'Andijon',
    'Toshkent',
    'Samarqand',
    'Navoiy',
    'Termiz',
    'Urganch',
    'Nukus',
  ]
      .map(
        (String value) =>
        DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: AppTextStyles.body14w7.copyWith(color: AppColors.color21)),
        ),
  )
      .toList();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 50.w,
        leading: IconButton(
            padding: EdgeInsets.only(left: 14.w),
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.arrowLeft)),
        title: Text("Profilingizni to'ldiring", style: AppTextStyles.body24wB),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            profileAvatarWidget(context),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: CustomTextField(
                controller: firstName,
                hintText: 'Ism',
                contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                hintStyle:
                AppTextStyles.body14w4.copyWith(color: AppColors.color9E),
                style: AppTextStyles.body14w4,
                backgroundColor: AppColors.colorFA,
                radius: 12.r,
              ),
            ),
            CustomTextField(
              hintText: 'Familiya',
              controller: lastName,
              contentPadding:
              EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
              hintStyle:
              AppTextStyles.body14w4.copyWith(color: AppColors.color9E),
              style: AppTextStyles.body14w4,
              backgroundColor: AppColors.colorFA,
              radius: 12.r,
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate:
                  DateTime.now().subtract(const Duration(days: 365 * 100)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
                ).then((value) {
                  if (value != null) {
                    birthday = DateFormat('dd-MM-yyyy').format(value);
                    setState(() {});
                  }
                });
              },
              child: Container(
                height: 56.h,
                margin: EdgeInsets.symmetric(vertical: 24.h),
                decoration: BoxDecoration(
                  color: AppColors.colorFA,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      birthday ?? "Tug'ilgan sana",
                      style: AppTextStyles.body14w4.copyWith(
                          color: birthday == null
                              ? AppColors.color9E
                              : AppColors.black),
                    ),
                    SvgPicture.asset(Assets.icons.calendar),
                  ],
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonStyleData: ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: AppColors.colorFA,
                      borderRadius: BorderRadius.circular(12.r),
                    )),
                iconStyleData: IconStyleData(
                    icon: SvgPicture.asset(Assets.icons.dropDown)),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 250.h,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 46.w,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.colorFA,
                    ),
                    elevation: 0,
                    scrollbarTheme: ScrollbarThemeData(
                      radius: Radius.circular(40.r),
                      thickness: MaterialStateProperty.all(6),
                      thumbVisibility: MaterialStateProperty.all(true),
                    )),
                value: viloyat,
                menuItemStyleData: MenuItemStyleData(height: 54.h),
                isExpanded: true,
                hint: Text(
                  "Viloyat",
                  style:
                  AppTextStyles.body14w4.copyWith(color: AppColors.color9E),
                  textAlign: TextAlign.left,
                ),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() => viloyat = value);
                  }
                },
                items: viloyatDownMenuItems,
              ),
            ),
            // SizedBox(height: 24.h),
            // DropdownButtonHideUnderline(
            //   child: DropdownButton2(
            //     buttonStyleData: ButtonStyleData(
            //         padding: EdgeInsets.symmetric(horizontal: 20.w),
            //         decoration: BoxDecoration(
            //           color: AppColors.colorFA,
            //           borderRadius: BorderRadius.circular(12.r),
            //         )),
            //     iconStyleData: IconStyleData(
            //         icon: SvgPicture.asset(Assets.icons.dropDown)),
            //     dropdownStyleData: DropdownStyleData(
            //         maxHeight: 250.h,
            //         width: MediaQuery.of(context).size.width - 46.w,
            //         padding: EdgeInsets.symmetric(horizontal: 20.w),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12.r),
            //           color: AppColors.colorFA,
            //         ),
            //         elevation: 0,
            //         scrollbarTheme: ScrollbarThemeData(
            //           radius: Radius.circular(40.r),
            //           thickness: MaterialStateProperty.all(6),
            //           thumbVisibility: MaterialStateProperty.all(true),
            //         )),
            //     value: viloyat,
            //     menuItemStyleData: MenuItemStyleData(height: 54.h),
            //     isExpanded: true,
            //     hint: Text(
            //       "Shahar",
            //       style:
            //           AppTextStyles.body14w4.copyWith(color: AppColors.color9E),
            //       textAlign: TextAlign.left,
            //     ),
            //     onChanged: (String? value) {
            //       if (value != null) {
            //         setState(() => viloyat = value);
            //       }
            //     },
            //     items: viloyatDownMenuItems,
            //   ),
            // ),
            // // Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: Opacity(
          opacity: viloyat == null ? 0.5 : 1,
          child: GradientButton(
            radius: 100.r,
            onPressed: () {
              var box = Hive.box<UserModel>('user');
              box.put('user', UserModel(
                  firstName: firstName.text.trim(),
                  lastName: lastName.text.trim(),
                  date: birthday ?? "",
                  region: viloyat ?? '',
                  icon: image ?? "",
                  phone: widget.phone));
              AnimNavigator.removeAndPush(context, MainScreen());
            },
            text: 'Saqlash',
          ),
        ),
      ),
    );
  }

  String? image;

  Widget profileAvatarWidget(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: () async {
              // context.go(Routes.profileImage);
              image =
              await AnimNavigator.push(context, const ProfileImageScreen());
              setState(() {});
              print(_image?.path);
              print('object');
            },
            child: Container(
                width: 140.r,
                height: 140.r,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: image == null
                    ? SvgPicture.asset(
                  Assets.icons.defAvatar,
                  width: 120.r,
                  height: 120.r,
                  fit: BoxFit.cover,
                )
                    : ClipOval(
                  child: Image.asset(
                    image ?? '',
                    width: 140.r,
                    fit: BoxFit.cover,
                    height: 140.r,
                  ),
                )),
          ),
          Positioned(
              bottom: -8.h,
              right: -8.h,
              child: IconButton(
                icon: SvgPicture.asset(Assets.icons.editPencil),
                onPressed: () async {
                  // context.go(Routes.profileImage);
                },
              ))
        ],
      ),
    );
  }
}
