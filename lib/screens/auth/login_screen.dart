import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/common/components/gradient_button.dart';
import 'package:protest/common/custom_textfield.dart';
import 'package:protest/common/widgets/gradient_button.dart';
import 'package:protest/screens/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 59.h),
                child: Text('Shaxsiy hisob yarating',
                    style: AppTextStyles.head48w7),
              ),
              CustomTextField(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Icon(Icons.email),
                ),
                hintText: 'Email',
                contentPadding: EdgeInsets.all(20.w),
                hintStyle: AppTextStyles.body14w4,
                backgroundColor: AppColors.gray.withOpacity(.2),
                borderColor: AppColors.gray.withOpacity(.2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: CustomTextField(
                  leading: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Icon(Icons.lock),
                  ),
                  hintText: 'Parol',
                  maxLines: 1,
                  contentPadding: EdgeInsets.all(20.w),
                  hintStyle: AppTextStyles.body14w4,
                  backgroundColor: AppColors.gray.withOpacity(.2),
                  borderColor: AppColors.gray.withOpacity(.2),
                  isPassword: true,
                ),
              ),
              GradientButton(
                onPressed: () {},
                height: 58.h,
                text: "Ro'yxatdan o'tish",
                radius: 100.r,
              ),
              SizedBox(height: 59.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  children: [
                    Flexible(
                        child: Divider(
                      color: AppColors.gray.withOpacity(.7),
                    )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text('yoki', style: AppTextStyles.body18w6)),
                    Flexible(
                      child: Divider(color: AppColors.gray.withOpacity(.7)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 59.h),
                child: WellcomeButton(
                    text: 'Google orqali kirish', icon: Assets.icons.google),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hisobingiz bormi?", style: AppTextStyles.body14w5),
                  TextButton(
                      onPressed: () {
                        // context.push(Routes.signUpPhone);
                        AnimNavigator.push(context, RegisterScreen());
                      },
                      child: Text("Tizimga kirish",
                          style: AppTextStyles.body14w7
                              .copyWith(color: AppColors.prymary)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
