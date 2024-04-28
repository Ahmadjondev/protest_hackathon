import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';

class WellcomeButton extends StatelessWidget {
  const WellcomeButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text, icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      // hoverColor: Colors.white,
      // focusColor: Colors.white,
      // highlightColor: Colors.white,
      // splashColor: Colors.white,
      child: Ink(
        width: size.width,
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 19.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.gray)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 12.w),
              Text(text, style: AppTextStyles.body16w6)
            ],
          ),
        ),
      ),
    );
  }
}
