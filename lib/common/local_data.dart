import 'package:protest/models/contest_model.dart';
import 'package:protest/models/quiz_model.dart';
import 'package:protest/models/university_model.dart';

import 'assets.dart';

List images = [
  'http://molotatv.ru/img/upload/1513009621-1.jpg',
  'http://molotatv.ru/img/upload/1513009621-1.jpg',
  'http://molotatv.ru/img/upload/1513009621-1.jpg',
  'http://molotatv.ru/img/upload/1513009621-1.jpg',
  'http://molotatv.ru/img/upload/1513009621-1.jpg',
];

List<ContestModel> contests = [
  ContestModel(
      title: "7-sinf matematika",
      image: Assets.images.contest1,
      candidates: "23 432",
      science: "Matematika",
      isSave: false),
  ContestModel(
      title: "Ingliz tilidan O’zbekiston b...",
      image: Assets.images.contest1,
      candidates: "10 934",
      science: "Ingliz tili",
      isSave: false),
  ContestModel(
      title: "Fizika bo’yicha O’zbekiston...",
      image: Assets.images.univ,
      candidates: "9 812",
      science: "Fizika",
      isSave: false),
];
List<QuizModel> quizData = [
  QuizModel(
    title: 'Natural va butun sonlar',
    image: 'image',
    science: 'Matematika',
    testCount: '10',
    isSave: false,
  ),
  QuizModel(
    title: 'Eng qadimgi tuzum',
    image: 'image',
    science: 'Tarix',
    testCount: '20',
    isSave: false,
  ),
  QuizModel(
    title: 'Kasrlar. Oddiy kasrlar',
    image: 'image',
    science: 'Matematika',
    testCount: '15',
    isSave: false,
  ),
];
List<UniversityModel> univers = [
  UniversityModel(
      name: 'Toshkent Axborot Texnalogiyalari universtiteti',
      image: Assets.images.contest1,
      science: 'science',
      enterBall: '65.6',
      address: 'Farg\'ona',
      isSave: false),
  UniversityModel(
      name: 'Fargona Davlat universtiteti',
      image: Assets.images.contest1,
      science: 'science',
      enterBall: '78.7',
      address: 'Farg\'ona',
      isSave: false),
  UniversityModel(
      name: 'Politex instituti',
      image: Assets.images.contest1,
      science: 'science',
      enterBall: '59.3',
      address: 'Farg\'ona',
      isSave: false),
];

List<Map> topUsers = [
  {'icon': Assets.images.avatar1, 'name': "Zokir", 'ball': "432"},
  {'icon': Assets.images.avatar7, 'name': "Muhammadali", 'ball': "214"},
  {'icon': Assets.images.avatar3, 'name': "Mushtariy", 'ball': "210"},
  {'icon': Assets.images.avatar8, 'name': "Karimjon", 'ball': "187"},
  {'icon': Assets.images.avatar1, 'name': "Narimon", 'ball': "134"}
];


List topbar = [
  'Hammasi',
  'Matematika',
  'Tarix',
  'Kimyo',
  'Biologiya',
  'Ona tili',
];