import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/error_handler.dart';

class FirebaseAuthServices {
  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('error comes form FirebaseServices.signUpWithEmailAndPassword and error is ${e.toString()} and code is ${e.code}');
      throw FirebaseFailure.fromCode(e.code);
    } catch (e) {
      log('error comes form FirebaseServices.signUpWithEmailAndPassword and error is ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('error comes form FirebaseServices.logInWithEmailAndPassword and error is ${e.toString()} and code is ${e.code}');

      throw FirebaseFailure.fromCode(e.code);
    } catch (e) {
      log('error comes form FirebaseServices.logInWithEmailAndPassword and error is ${e.toString()} ');

      throw CustomException(message: 'حدث خطأ ما');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } catch (e) {
      log('error comes form FirebaseServices.signInWithGoogle and error is ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } catch (e) {
      log('error comes form FirebaseServices.signInWithGoogle and error is ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما');
    }
  }
}
