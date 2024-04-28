import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protest/common/anim_navigator.dart';
import 'package:protest/common/app_color.dart';
import 'package:protest/common/app_text_style.dart';
import 'package:protest/common/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protest/common/custom_textfield.dart';
import 'package:protest/common/local_data.dart';
import 'package:protest/models/user_model.dart';
import 'package:protest/screens/home/contest_screen.dart';
import 'package:protest/screens/home/cubit/data_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    user = Hive.box<UserModel>('user').get('user');
  }

  int actIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    var contest = context.read<DataCubit>()..getData();
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.gray),
                      child: Image.asset(Assets.images.avatar8),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${user?.firstName} ${user?.lastName}',
                            style: AppTextStyles.body20w7),
                        Text('10 XP', style: AppTextStyles.body16w4)
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.icons.notification)
                  ],
                ),
              ),
              Image.asset(Assets.images.banner),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top foydalanuvchilar', style: AppTextStyles.body20w7),
                    GestureDetector(
                      onTap: () {
                        // context.goNamed(Routes.topUsers);
                      },
                      child: Text('Barchasi',
                          style: AppTextStyles.body16w7
                              .copyWith(color: AppColors.prymary)),
                    )
                  ],
                ),
              ),
              Container(
                height: 125.h,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20.w, top: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: topUsers.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 80.h,
                          child: Stack(
                            children: [
                              Container(
                                width: 72.w,
                                height: 72.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.gray),
                                child: Image.asset(topUsers[index]['icon']),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: AppColors.gradient,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                  child: Text(
                                    '${topUsers[index]['ball']} XP',
                                    style: AppTextStyles.body10wb
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          topUsers[index]['name'],
                          style: AppTextStyles.body16w6,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(width: 16.w),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomTextField(
                  backgroundColor: AppColors.gray.withOpacity(.3),
                  hintText: 'Kitob qidirish',
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.search),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('So’ngi olimpiadalar', style: AppTextStyles.body20w7),
                    Text('Barchasi',
                        style: AppTextStyles.body16w7
                            .copyWith(color: AppColors.prymary))
                  ],
                ),
              ),
              BlocBuilder<DataCubit, DataState>(
                bloc: contest,
                builder: (context, state) {
                  return state.when(
                    loading: () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                      itemCount: 3,
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 60,
                                  color: AppColors.black.withOpacity(0.05))
                            ]),
                        height: 84.h,
                      ),
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    loaded: (contests, quizzes, universities) {
                      var contest = contests!;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                        itemCount: contests.length,
                        itemBuilder: (_, index) {
                          var item = contest[index];
                          return InkWell(
                            onTap: () {
                              AnimNavigator.push(context, ContestScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(32.r),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 60,
                                        color: AppColors.black.withOpacity(0.05))
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 84.w,
                                    height: 84.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        color: AppColors.prymary,
                                        image: DecorationImage(
                                            image: AssetImage(item.image))),
                                  ),
                                  SizedBox(width: 16.w),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 10.w),
                                        decoration: BoxDecoration(
                                            color: AppColors.prymary
                                                .withOpacity(.85),
                                            borderRadius:
                                                BorderRadius.circular(6.r)),
                                        child: Text(
                                          item.science,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.body10w6.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .5,
                                        child: Text(item.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles.body18w7),
                                      ),
                                      Text('${item.candidates} ishtirokchi',
                                          style: AppTextStyles.body12w5)
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(Assets.icons.actBookmark)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16.h),
                      );
                    },
                    error: () => Container(),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top testlar', style: AppTextStyles.body20w7),
                    Text('Barchasi',
                        style: AppTextStyles.body16w7
                            .copyWith(color: AppColors.prymary))
                  ],
                ),
              ),
              Container(
                height: 38.h,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: topbar.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        actIndex = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                          gradient:
                              actIndex == index ? AppColors.gradient : null,
                          border: Border.all(
                              color: actIndex == index
                                  ? Colors.transparent
                                  : AppColors.prymary),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Text(
                        topbar[index],
                        style: AppTextStyles.body16w6.copyWith(
                            color: actIndex == index
                                ? AppColors.white
                                : AppColors.prymary),
                      ),
                    ),
                  ),
                  separatorBuilder: (_, index) => SizedBox(width: 10.w),
                ),
              ),
              BlocBuilder<DataCubit, DataState>(
                bloc: contest,
                builder: (context, state) {
                  return state.when(
                    loading: () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                      itemCount: 3,
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 60,
                                  color: AppColors.black.withOpacity(0.05))
                            ]),
                        height: 84.h,
                      ),
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    loaded: (contests, quizzes, universities) {
                      var quiz = quizzes!;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(20.w),
                        itemCount: 3,
                        itemBuilder: (_, index) {
                          var item = quiz[index];
                          return Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(32.r),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 60,
                                      color: AppColors.black.withOpacity(0.05))
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 16.w),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.prymary.withOpacity(.2),
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      child: Text(
                                        '${item.science}',
                                        style: AppTextStyles.body10w6
                                            .copyWith(color: AppColors.prymary),
                                      ),
                                    ),
                                    Text('${item.title}',
                                        style: AppTextStyles.body18w7),
                                    Text('Testlar soni: ${item.testCount}',
                                        style: AppTextStyles.body14w6),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(Assets.icons.actBookmark)
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16.h),
                      );
                    },
                    error: () => Container(),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Universitetlar', style: AppTextStyles.body20w7),
                    Text('Barchasi',
                        style: AppTextStyles.body16w7
                            .copyWith(color: AppColors.prymary))
                  ],
                ),
              ),
              BlocBuilder<DataCubit, DataState>(
                bloc: contest,
                builder: (context, state) {
                  return state.when(
                    loading: () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                      itemCount: 3,
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 60,
                                  color: AppColors.black.withOpacity(0.05))
                            ]),
                        height: 84.h,
                      ),
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    loaded: (contests, quizzes, universities) {
                      var univer = universities!;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(20.w),
                        itemCount: 3,
                        itemBuilder: (_, index) {
                          var item = univer[index];
                          return Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(32.r),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 60,
                                      color: AppColors.black.withOpacity(0.05))
                                ]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 84.w,
                                  height: 84.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: AppColors.prymary,
                                      image: DecorationImage(
                                          image: AssetImage(item.image))),
                                ),
                                SizedBox(width: 16.w),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.prymary.withOpacity(.1),
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        'Top Universitet',
                                        style: AppTextStyles.body10w6
                                            .copyWith(color: AppColors.prymary),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .5,
                                      child: Text('${item.name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.body16w7),
                                    ),
                                    Text(
                                        'Eng kichik kirish bali: ${item.enterBall}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.body16w5),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 16.h),
                      );
                    },
                    error: () => Container(),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Text('Bizni ijtimoiy tarmoqlar',
                    style: AppTextStyles.body20w7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        Assets.icons.instagram,
                        // color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: SvgPicture.asset(
                        Assets.icons.telegram,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
