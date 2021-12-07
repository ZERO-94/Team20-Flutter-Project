class CompletedFood{
  CompletedFood({
    required this.date,
    required this.userId,
    required this.userHeight,
    required this.userAge,
    required this.userGender,
    required this.userWeight,
    required this.userWorkingLevel,
    required this.foodList,
  });

  String? date;
  final String? userId;
  final double? userHeight;
  final double? userWeight;
  final int? userAge;
  final bool? userGender;
  final int? userWorkingLevel;
  List<String>? foodList;
}