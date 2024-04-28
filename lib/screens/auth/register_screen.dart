import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:protest/common/components/gradient_button.dart';
import 'package:protest/common/custom_textfield.dart';
import 'package:protest/common/widgets/gradient_button.dart';
import 'package:protest/screens/auth/profile_complete_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child:
                  Text('Shaxsiy hisob yarating', style: AppTextStyles.head48w7),
            ),
            CustomTextField(
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Icon(Icons.phone),
              ),
              hintText: 'Telefon',
              contentPadding: EdgeInsets.all(20.w),
              hintStyle: AppTextStyles.body14w4,
              backgroundColor: AppColors.gray.withOpacity(.5),
              borderColor: AppColors.gray.withOpacity(.5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CustomTextField(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Icon(Icons.lock),
                ),
                hintText: 'Sms kod',
                contentPadding: EdgeInsets.all(20.w),
                hintStyle: AppTextStyles.body14w4,
                backgroundColor: AppColors.gray.withOpacity(.5),
                borderColor: AppColors.gray.withOpacity(.5),
                trailing: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text('Kod so’rash',
                      style: AppTextStyles.body14w7
                          .copyWith(color: AppColors.prymary)),
                ),
              ),
            ),
            GradientButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString('user', "value");
                AnimNavigator.push(
                    context, ProfileCompleteScreen(phone: phone.text.trim()));
              },
              height: 58.h,
              text: "Ro'yxatdan o'tish",
              radius: 100.r,
            ),
            SizedBox(height: 59.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Row(
                children: [
                  Flexible(child: Divider()),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text('yoki', style: AppTextStyles.body18w6)),
                  Flexible(
                    child: Divider(),
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
                      // context.push(Routes.login);
                    },
                    child: Text("Tizimga kirish",
                        style: AppTextStyles.body14w7
                            .copyWith(color: AppColors.prymary)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
