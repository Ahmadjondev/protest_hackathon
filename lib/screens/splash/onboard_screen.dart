import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/components/gradient_button.dart';
import 'package:protest/common/constants.dart';
import 'package:protest/screens/auth/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 69.h),
          Flexible(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SvgPicture.asset(onboardingData[index].icon),
                    SizedBox(height: 50.h),
                    SizedBox(
                      width: size.width,
                      child: Text(
                        onboardingData[index].text,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body33w7
                            .copyWith(color: AppColors.prymary),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: onboardingData.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              dotColor: AppColors.gray,
              activeDotColor: AppColors.prymary,
            ),
            onDotClicked: (newIndex) {
              setState(() {
                currentIndex = newIndex;
                controller.animateToPage(newIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 47.h, top: 60.h, left: 18.w, right: 18.w),
            child: GradientButton(
              onPressed: () {
                if ((controller.page ?? 0).toInt() !=
                    onboardingData.length - 1) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn);
                } else {
                  AnimNavigator.replace(context, const RegisterScreen());
                }
              },
              height: 58.h,
              text: "Davom etish",
              radius: 100.r,
            ),
          )
        ]),
      ),
    );
  }
}
