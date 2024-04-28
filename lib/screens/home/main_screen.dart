import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/constants.dart';
import 'package:protest/screens/home/pages/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: IndexedStack(
        index: pageindex,
        children: [
          HomePage(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageindex,
          unselectedLabelStyle: TextStyle(fontSize: 12),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
          onTap: (value) {
            setState(() {
              pageindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icon[0]),
              activeIcon: SvgPicture.asset(iconAct[0]),
              label: bottomName[0],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icon[1]),
              activeIcon: SvgPicture.asset(iconAct[1]),
              label: bottomName[1],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icon[2]),
              activeIcon: SvgPicture.asset(iconAct[2]),
              label: bottomName[2],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icon[3]),
              activeIcon: SvgPicture.asset(iconAct[3]),
              label: bottomName[3],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(icon[4]),
              activeIcon: SvgPicture.asset(iconAct[4]),
              label: bottomName[4],
            ),
          ]),
    );
  }
}

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.activeIconPath,
    required this.isActive,
  });

  final void Function() onPressed;
  final String iconPath;
  final String activeIconPath;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // bool isActive = selectedIndex == activeIndex;
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          SvgPicture.asset(
            isActive ? activeIconPath : iconPath,
            width: 24.w,
            height: 24.w,
            fit: BoxFit.cover,
          ),
          // Label
          // const SizedBox(height: 6),
        ],
      ),
    );
  }
}
