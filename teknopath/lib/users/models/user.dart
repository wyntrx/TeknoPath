class Student {
  // int user_id;
  // String user_names;
  // String user_email;
  // String user_password;
  String student_id;
  String student_email;

  Student(
    this.student_id,
    this.student_email,
    // this.user_id,
    // this.user_names,
    // this.user_email,
    // this.user_password,
  );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        json["student_id"],
        json["student_email"],
        // int.parse(json["user_id"]),
        // json["user_names"],
        // json["user_email"],
        // json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        'student_id': student_id,
        'student_email': student_email,
        // 'user_id': user_id.toString(),
        // 'user_name': user_names,
        // 'user_email': user_email,
        // 'user_password': user_password,
      };
}
