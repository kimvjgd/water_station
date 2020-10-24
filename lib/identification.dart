import 'package:cor_waterstation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cor_waterstation/constants.dart';
import 'package:cor_waterstation/main_page.dart';
import 'package:cor_waterstation/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



String person_name= '';
String person_phone= '';
List person_Info= [];


class Identification extends StatefulWidget {


  static const String id = 'registration_screen';

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GoogleSignIn googleSignIn = GoogleSignIn();


  final _firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Hero(
                    tag: 'logo', // welcome_screen의 tag와 같은 이름이여야 한다.
                    child: Container(
                      height: 180.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Text('한번 설정하면 못바꾸니 제발!! 잘 설정해줘요!!!!!!!!! 나중 수정 사항임'),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      person_name = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your name'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        person_phone = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your phone_number')),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  RoundedButton(
                    title: 'Register',
                    colour: Colors.blue.shade900,
                    onPressed: () async {
                      await _firestore.collection('person').add({
                        'email' : email,
                        'name' : person_name,
                        'phone' : person_phone,
                        'invest_amount' : 0,
                        'recover_amount' : 0,
                        'invest_date' : '@@@@/@@/@@  @@:@@',
                        'description' : ''
                      });
                      try {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => MainPage()));
                        setState(() {
                        });
                      }
                      catch (e) {
                        print(e);
                      }
                    },),
                ],
              ),
            ),
          ),
        ),
    );
  }
}