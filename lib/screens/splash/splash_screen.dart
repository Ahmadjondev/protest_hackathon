import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/screens/home/main_screen.dart';
import 'package:protest/screens/splash/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pref.getString('user') != null) {
      AnimNavigator.replace(context, const MainScreen());
      } else {
        AnimNavigator.replace(context, const OnboardScreen());

      //   context.go(Routes.onboarding);
      }
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * .28),
          Center(child: SvgPicture.asset(Assets.icons.splashIcon)),
          Padding(
            padding: EdgeInsets.only(top: 27.h, bottom: 100.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ProTest',
                  style: AppTextStyles.head50w4.copyWith(
                      color: AppColors.prymary,
                      fontWeight: FontWeight.bold,
                      height: 0),
                ),
                Text(
                  'Online ta’lim',
                  style: AppTextStyles.head16wB.copyWith(
                      color: AppColors.prymary,
                      fontWeight: FontWeight.bold,
                      height: 0),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * .15,
            width: size.height * .15,
            margin: EdgeInsets.all(64.r),
            child: Lottie.network(
              'https://lottie.host/27fc7882-c2b2-422b-921d-28480b49bccc/6n5iIIOsOj.json',
              height: size.height * .15,
              width: size.height * .15,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
