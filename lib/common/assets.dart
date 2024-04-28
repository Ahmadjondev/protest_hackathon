abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();

// ignore: library_private_types_in_public_api
// static _ChannelsList get channelList =>> _ChannelsList();

// ignore: library_private_types_in_public_api
// static _Videos get videos => const _Videos();

// ignore: library_private_types_in_public_api
// static _Audios get audios => const _Audios();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get competition => '$basePath/competition.svg';

  String get arrowLeft => '$basePath/arrow_left.svg';

  String get editPencil => '$basePath/edit_pencil.svg';

  String get calendar => '$basePath/calendar.svg';

  String get dropDown => '$basePath/drop_down.svg';

  String get defAvatar => '$basePath/def_avatar.svg';

  String get competitionAct => '$basePath/competition_2.svg';

  String get home => '$basePath/home.svg';

  String get homeAct => '$basePath/home_2.svg';

  String get rating => '$basePath/rating.svg';

  String get ratingAct => '$basePath/rating_2.svg';

  String get training => '$basePath/training.svg';

  String get trainingAct => '$basePath/training_2.svg';

  String get profile => '$basePath/profile.svg';

  String get profileAct => '$basePath/profile_2.svg';

  String get settings => '$basePath/settings.svg';

  String get google => '$basePath/google.svg';

  String get phone => '$basePath/phone.svg';

  String get on1 => '$basePath/on1.svg';

  String get on2 => '$basePath/on2.svg';

  String get on3 => '$basePath/on3.svg';

  String get splashIcon => '$basePath/splash_icon.svg';

  String get wellcome => '$basePath/wellcome.svg';
  String get actBookmark => '$basePath/act_bookmark.svg';
  String get bookmark => '$basePath/bookmark.svg';
  String get telegram => '$basePath/telegram.svg';
  String get instagram => '$basePath/instagram.png';
  String get notification => '$basePath/notification.svg';
  String get search => '$basePath/search.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get titleSonger => '$basePath/title.png';

  String get avatar1 => '$basePath/avatars/Ellipse.png';

  String get avatar2 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar.png';

  String get avatar3 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar-1.png';

  String get avatar4 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar-2.png';

  String get avatar5 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar-3.png';

  String get avatar6 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar-4.png';

  String get avatar7 =>
      '$basePath/avatars/Type=Edit Avatar, Component=Avatar-5.png';

  String get avatar8 => '$basePath/avatars/avata8.png';
  String get contest1 => '$basePath/contest1.png';
  String get univ => '$basePath/univ.png';
  String get banner => '$basePath/banner.png';
}

// class _Audios extends _AssetsHolder {
//   const _Audios() : super('audio');

//   String get one => "audio/1.mp3";
// }
// class _Videos extends _AssetsHolder {
//   const _Videos() : super('video');

// }
