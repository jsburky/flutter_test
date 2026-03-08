import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/login.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) => home(title: 'Hello $email')));
  }


  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) => home(title: 'Hello $email')));
  }

  Future<void> signout({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }
}