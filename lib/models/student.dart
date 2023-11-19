class Student {
  //
  int? id;
  String name;
  String lastName;
  int grade;
  String status;

  Student({
    required this.name,
    required this.lastName,
    required this.grade,
    required this.status,
  });
  Student.withId({
    required this.id,
    required this.name,
    required this.lastName,
    required this.grade,
    required this.status,
  });
  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
