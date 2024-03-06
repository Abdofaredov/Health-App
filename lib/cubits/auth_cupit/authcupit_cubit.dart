import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'authcupit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthcupitInitial());

  Future<void> Signup({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(AuthSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailure(errorMessage: 'هذا الحساب موجود بالفعل'));
      }
    }
  }

  Future<void> signin({required String email, required String password}) async {
    emit(AuthLoadingforsignin());
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSucsessforsignin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailureforsignin(
            errorMessageforsignin: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailureforsignin(
            errorMessageforsignin: 'Wrong password provided for that user.'));
      } else if (e.code == 'invalid-credential') {
        emit(AuthFailureforsignin(
            errorMessageforsignin: 'something went wrong !!'));
      }
      print('e.code ===== ${e.code.toString()}');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    emit(SignOut());
  }
}
