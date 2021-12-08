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

      if (e.message ==
          "The email address is already in use by another account.") {
        Fluttertoast.showToast(
            msg: "E-mail já existe na base de dados.",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.grey,
            timeInSecForIosWeb: 5,
            fontSize: 18);
      }
    }
  }
}
