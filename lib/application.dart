import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/screens/splash/splash_screen.dart';

import 'screens/home/cubit/data_cubit.dart';

class ProTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: BlocProvider(
          create: (context) => DataCubit(),
          child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.white,
            ),
            title: 'ProTest',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
