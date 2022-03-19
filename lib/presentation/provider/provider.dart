import 'package:flutter/material.dart';
import 'package:interview_newstartup/data/scources/firestore_source/firebase.dart';
import 'package:interview_newstartup/data/scources/local_source/storage.dart';

enum CounterKey { counterKey }

class CounterProvider extends ChangeNotifier {
  final Storage _storage = Storage();
  final Firebase _firebase = Firebase();

  int _countervalue = 0;

  get getCounterKey => CounterKey.counterKey;

  get countervalue => _countervalue;

  incrementCounterValue() {
    _countervalue++;
    saveToLocalStore();
    notifyListeners();
  }

  decrementCounterValue() {
    _countervalue--;
    saveToLocalStore();
    notifyListeners();
  }

  saveToLocalStore() {
    _storage.storeCounterValue('$getCounterKey', countervalue);
  }

  String registerMessage = '';
  String loginMessage = '';

  Future<String> registerUser(
      {required String email, required String password}) async {
    await _firebase
        .register(
      email: email,
      password: password,
    )
        .then(
      (value) {
        registerMessage = value.toString();
      },
    );
    return registerMessage;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    await _firebase
        .login(
      email: email,
      password: password,
    )
        .then(
      (value) {
        loginMessage = value.toString();
      },
    );
    return loginMessage;
  }

  signOutUser() async {
    await _firebase.signOut();
  }
}
