class User {
  const User({
    required this.userId,
    required this.userName,
    required this.userAge,
    required this.userGender,
    required this.userWeight,
    required this.userHeight,
    required this.userWorkingLevel,
  });

  final String? userName;
  final String? userId;
  final int? userAge;
  final String? userGender;
  final double? userWeight;
  final double? userHeight;
  final double? userWorkingLevel;

}