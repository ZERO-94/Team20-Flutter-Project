class User {
  const User({
    required this.userId,
    required this.username,
    required this.userAge,
    required this.userGender,
    required this.userWeight,
    required this.userHeight,
    required this.userWorkingLevel,
  });

  final String? username;
  final String? userId;
  final int? userAge;
  final bool? userGender;
  final double? userWeight;
  final double? userHeight;
  final int? userWorkingLevel;

}