// import 'package:cor_waterstation/identification.dart';
// import 'package:cor_waterstation/main_page.dart';
// import 'package:cor_waterstation/tab_page.dart';
// import 'package:cor_waterstation/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class RootPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<FirebaseUser>(     // 데이터의 흐름을 읽어서 (데이터가 변경되었을때) 통제를 받아 그것에 대해 반응한다.
//         stream: FirebaseAuth.instance.onAuthStateChanged, // 인증이 되거나 끊어졌을때 상태가 변경이되면서 변경된 상태에 따라서 snapshot이 흘러들어옴
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {               // snapshot에 firebaseuser 정보가 들어온다.
//             return TabPage();      // data가 존재하면 tabpage로 간다.
//           } else {
//             return WelcomeScreen();             //
//           }
//         });
//   }
// }
//
//
//
