// import 'package:cor_waterstation/Dialogs.dart';
// import 'package:cor_waterstation/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cor_waterstation/constants.dart';
// import 'package:cor_waterstation/main_page.dart';
// import 'package:cor_waterstation/rounded_button.dart';
//
//
// class LoginScreen extends StatefulWidget {
//   static const String id = 'login_screen';
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   Dialogs dialogs = Dialogs();
//
//   final _auth = FirebaseAuth.instance;
//   bool showSpinner = false;
//   String email;
//   String password;
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 SizedBox(
//                   height: 130,
//                 ),
//                 Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 200.0,
//                     child: Image.asset('images/logo.png'),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 48.0,
//                 ),
//                 TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black),
//                     onChanged: (value) {
//                       email = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your email')),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                     obscureText: true,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black),
//                     onChanged: (value) {
//                       password = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your password')),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 RoundedButton(
//                   title: 'Log In',
//                   colour: Colors.blue.shade900,
//                   onPressed: () async {
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     try {
//                       final user = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);
//                           showSpinner = false;
//                       if (user != null) {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
//                         return;
//                       }else{
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
//                         // return dialogs.information(context, '로그인 오류', '아이디 혹은 비밀번호가 잘못되었습니다. \n'
//                         //     '다시 확인 부탁드립니다.');
//                       }
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
