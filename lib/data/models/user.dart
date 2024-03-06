class Usermodel {
  String firstname;
  String lastname;
  String birthdate;
  String sexual;
  String phoneNumber;

  String email;

  Usermodel(
      {required this.firstname,
      required this.lastname,
      required this.birthdate,
      required this.sexual,
      required this.phoneNumber,
      required this.email});

  tojson() {
    return {
      'firstName': firstname,
      'LastName': lastname,
      'BirthDate': birthdate,
      'Sexual': sexual,
      'phoneNumber': phoneNumber,
      'email': email
    };
  }
}
