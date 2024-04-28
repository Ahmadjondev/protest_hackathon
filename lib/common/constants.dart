import 'package:protest/common/assets.dart';

List icon = [
  Assets.icons.home,
  Assets.icons.rating,
  Assets.icons.competition,
  Assets.icons.training,
  Assets.icons.profile
];
List iconAct = [
  Assets.icons.homeAct,
  Assets.icons.ratingAct,
  Assets.icons.competitionAct,
  Assets.icons.trainingAct,
  Assets.icons.profileAct
];
List bottomName = [
 "Bosh sahifa",
 "Reyting",
 "Bellashuvlar",
 "Ta`lim",
 "Hisob",
];

List<OnboardingModel> onboardingData = [
  OnboardingModel(
      icon: Assets.icons.on1,
      text: "Biz eng yaxshi o'quv kurslarni taqdim etamiz!"),
  OnboardingModel(
      icon: Assets.icons.on2,
      text: "Istalgan vaqtda, istalgan joyda oson va qulay o'rganing"),
  OnboardingModel(
      icon: Assets.icons.on3,
      text:
          "Keling, hoziroq ProTest bilan bilimingizni o'shirishni boshlaymiz"),
];

class OnboardingModel {
  OnboardingModel({required this.text, required this.icon});
  final String text, icon;
}
