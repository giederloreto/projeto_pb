import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ControllerCadastro {
  signup(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) => print(userCredential.user!.email));
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.message!,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.grey,
          timeInSecForIosWeb: 5,
          fontSize: 18);
    }
  }
}
