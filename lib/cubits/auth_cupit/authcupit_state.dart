part of 'authcupit_cubit.dart';

@immutable
class AuthState {}

class AuthcupitInitial extends AuthState {}

class AuthLoading extends AuthState {}

// ignore: must_be_immutable
class AuthSucsess extends AuthState {
  String sucsessmessage = 'تم إنشاء الحساب بنجاح ';
}

// ignore: must_be_immutable
class AuthFailure extends AuthState {
  String errorMessage;
  AuthFailure({required this.errorMessage});
}
//states for sign in

class AuthLoadingforsignin extends AuthState {}

// ignore: must_be_immutable
class AuthSucsessforsignin extends AuthState {
  String sucsessmessage = 'تم تسجيل الدخول بنجاح ';
}

// ignore: must_be_immutable
class AuthFailureforsignin extends AuthState {
  String errorMessageforsignin;
  AuthFailureforsignin({required this.errorMessageforsignin});
}

class SignOut extends AuthState {}
