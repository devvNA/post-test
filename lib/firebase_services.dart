import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future<bool> onLogin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> onRegistration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future addData({
    required String nama,
    required String hubungan,
    required int contact,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("post_test").add({
        "nama": nama,
        "hubungan": hubungan,
        "kontak": contact,
      });
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}
