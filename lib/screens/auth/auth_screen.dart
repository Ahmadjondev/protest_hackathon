import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/common/components/gradient_button.dart';
import 'package:protest/common/widgets/gradient_button.dart';
import 'package:protest/screens/auth/login_screen.dart';
import 'package:protest/screens/auth/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 120.h, bottom: 49.h),
                child: Center(child: SvgPicture.asset(Assets.icons.wellcome)),
              ),
              Text(
                'Hush kelibsiz!',
                style: AppTextStyles.head48w7,
              ),
              Padding(
                padding: EdgeInsets.only(top: 49.h, bottom: 16.h),
                child: WellcomeButton(
                    onTap: () {
                      AnimNavigator.push(context, const RegisterScreen());
                    },
                    text: 'Telefon orqali kirish',
                    icon: Assets.icons.phone),
              ),
              WellcomeButton(
                  text: 'Google orqali kirish', icon: Assets.icons.google),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  children: [
                    const Flexible(child: Divider()),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text('yoki', style: AppTextStyles.body18w6)),
                    const Flexible(
                      child: Divider(),
                    )
                  ],
                ),
              ),
              GradientButton(
                onPressed: () {
                  // context.pushNamed(Routes.signUpEmail);
                  AnimNavigator.push(context, const LoginScreen());
                },
                height: 58.h,
                text: "Parol bilan tizimga kirish",
                radius: 100.r,
              ),
              SizedBox(height: 49.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hisobingiz yo'qmi?",
                      style: AppTextStyles.body14w4
                          .copyWith(color: AppColors.gray)),
                  SizedBox(width: 8.w),
                  Text("Ro'yxatdan o'tish",
                      style: AppTextStyles.body14w6
                          .copyWith(color: AppColors.prymary))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
