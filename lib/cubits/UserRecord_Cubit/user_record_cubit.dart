import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/data/models/user.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'user_record_state.dart';

class UserRecordCubit extends Cubit<UserRecordState> {
  UserRecordCubit() : super(UserRecordInitial());
  TextEditingController? birthdate = TextEditingController();
  TextEditingController? firstName = TextEditingController();
  TextEditingController? lastname = TextEditingController();
  TextEditingController? sexual = TextEditingController();
  TextEditingController? phonenumber = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(Usermodel? user) {
    // Call the user's CollectionReference to add a new user
    return users
        .add(user!.tojson())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
