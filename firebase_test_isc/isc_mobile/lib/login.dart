import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Create a new credential
    final credential;
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth;
    if (googleUser != null) {
      googleAuth = await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    } else {
      credential = "Fatal : Login Failed";
    }
    return await FirebaseAuth.instance.signInWithCredential(credential);
    // Once signed in, return the UserCredential
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FlatButton(
              color: Colors.grey.withOpacity(0.3),
              child: Text("Google Login"),
              onPressed: signInWithGoogle,
            )
          ],
        ),
      ),
    );
  }
}
