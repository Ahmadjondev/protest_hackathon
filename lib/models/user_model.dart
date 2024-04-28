import 'package:hive/hive.dart';

part 'user_model.g.dart'; // Add this line

@HiveType(typeId: 0) // Add this line
class UserModel extends HiveObject {
  @HiveField(0) // Add this line
  String firstName;

  @HiveField(1) // Add this line
  String lastName;

  @HiveField(2) // Add this line
  String date;

  @HiveField(3) // Add this line
  String region;

  @HiveField(4) // Add this line
  String icon;

  @HiveField(5) // Add this line
  String phone;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.region,
    required this.icon,
    required this.phone,
  });
}
