// import 'package:cor_waterstation/investment_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:cor_waterstation/constants.dart';
// import 'package:cor_waterstation/main_page.dart';
// import 'package:cor_waterstation/rounded_button.dart';
// import 'package:cor_waterstation/tab_page.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// String person_email;
// String person_name;
// String person_phone;
//
//
// class RegistrationScreen extends StatefulWidget {
//   static const String id = 'registration_screen';
//
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   GlobalKey<FormState> _formKey = GlobalKey();
//   // ignore: deprecated_member_use
//   final _firestore = Firestore.instance;
//   final _auth = FirebaseAuth.instance;
//   bool showSpinner = false;
//   String email;
//   String password;
//   dynamic person_list = [];
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
//                   height: 80,
//                 ),
//                 Hero(
//                   tag: 'logo', // welcome_screen의 tag와 같은 이름이여야 한다.
//                   child: Container(
//                     height: 180.0,
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
//                       person_email = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your email'),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                     obscureText: true,
//                     // for password security
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black),
//                     onChanged: (value) {
//                       password = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your password')),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//
//                 TextField(
//                     // for password security
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black),
//                     onChanged: (value) {
//                       person_name = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                         hintText: 'Enter your name')),
//
//                 SizedBox(
//                   height: 32.0,
//                 ),
//                 RoundedButton(
//                   title: 'Register',
//                   colour: Colors.blue.shade900,
//                   onPressed: () async {
//                     person_list= [person_email, person_name, person_phone];
//                     _firestore.collection('person').add(person_list);
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     try {
//                       final newUser = await _auth
//                           .createUserWithEmailAndPassword(
//                           email: email, password: password);
//                       if (newUser != null) {
//                         Navigator.push(context, MaterialPageRoute(builder: (
//                             context) => MainPage()));
//                       }
//                       setState(() {
//                         showSpinner = false;
//                       });
//                     }
//                     catch (e) {
//                       print(e);
//                     }
//                   },),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }