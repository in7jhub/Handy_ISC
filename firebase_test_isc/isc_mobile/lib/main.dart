// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:isc_mobile/login.dart';
import 'CustomDatabase.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// --------------------------------------------------
// Events are fired when the following occurs:
// Right after the listener has been registered.
// When a user is signed in.
// When the current user is signed out.

// FirebaseAuth.instance
//   .authStateChanges()
//   .listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });
// --------------------------------------------------

void main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("firebase sns login"),
        ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (!snapshot.hasData) {
              return LoginWidget();
            } else {
              return Text("로그인 성공!");
            }
          },
        ),
      ),
    );
  }
}
