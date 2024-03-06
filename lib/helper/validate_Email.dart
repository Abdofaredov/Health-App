// ignore: file_names
validateEmail(String? value) {
  if (value!.isEmpty) {
    return 'Enter Email ';
  }
  bool validateEmail =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(value);
  if (!validateEmail) {
    return 'validate email like that : ${'example@gmail.com'} ';
  } else {
    return null;
  }
}
