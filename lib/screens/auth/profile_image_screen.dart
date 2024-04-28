import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/common/components/gradient_button.dart';

class ProfileImageScreen extends StatefulWidget {
  const ProfileImageScreen({super.key});

  @override
  State<ProfileImageScreen> createState() => _ProfileImageScreenState();
}

class _ProfileImageScreenState extends State<ProfileImageScreen> {
  File? _image;

  final picker = ImagePicker();
  List<String> avatars = [
    Assets.images.avatar8,
    Assets.images.avatar1,
    Assets.images.avatar7,
    Assets.images.avatar6,
    Assets.images.avatar5,
    Assets.images.avatar4,
    Assets.images.avatar3,
    Assets.images.avatar2,
  ];
  int selectedIndex = 0;

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
        title: Text("Profil rasmini tanlang", style: AppTextStyles.body24wB),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            profileAvatarWidget(),
            Container(
              height: 200.h,
              margin: EdgeInsets.only(top: 54.h),
              child: GridView.builder(
                itemCount: avatars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 21.w,
                  crossAxisSpacing: 21.w,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: selectedIndex == index
                            ? Border.all(width: 3.w, color: AppColors.prymary)
                            : null,
                      ),
                      child: Image.asset(avatars[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
        child: GradientButton(
          radius: 100.r,
          onPressed: () {
            Navigator.pop(context, avatars[selectedIndex]);
          },
          text: 'Saqlash',
        ),
      ),
    );
  }

  Widget profileAvatarWidget() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: () async {
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile?.path != null) {
                _image = File(pickedFile?.path ?? '');
                setState(() {});
                // prefs?.setString('userImage', _image?.path ?? '');
              }
            },
            child: Container(
                width: 140.r,
                height: 140.r,
                decoration: BoxDecoration(
                  color: AppColors.white,
                ),
                child: _image?.path == null
                    ? SvgPicture.asset(
                        Assets.icons.defAvatar,
                        width: 140.r,
                        height: 140.r,
                      )
                    : ClipOval(
                        child: Image.file(
                          File(_image?.path ?? ''),
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
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile?.path != null) {
                    _image = File(pickedFile?.path ?? '');
                    setState(() {});
                  }
                },
              ))
        ],
      ),
    );
  }
}
