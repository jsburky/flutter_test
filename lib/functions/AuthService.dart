import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  
  Future<void> updatePassword({
    required BuildContext context,
    required String newPassword
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPassword);
    
  }

  Future<void> signingoogle({
    required BuildContext context
  }) async {
    final user = await GoogleSignIn.instance.authenticate();
    final auth = await user.authentication;
    var creds = GoogleAuthProvider.credential(idToken: auth.idToken);
    await FirebaseAuth.instance.signInWithCredential(creds);
    
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }
}