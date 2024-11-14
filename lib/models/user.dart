class User {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String age;

  User({required this.name, required this.email, required this.phone, required this.password, required this.age});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile_number': phone,  // تأكد من أن هذا هو الاسم الصحيح
      'password': password,
      'age': age,
    };
  }
}
