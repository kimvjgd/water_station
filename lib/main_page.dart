import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cor_waterstation/tab_page.dart';


class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> TabPage()));
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('images/$assetName.png', width: 250.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildThirdImage(String assetName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          child: Image.asset('images/$assetName.png', width: 250.0),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Container(
      alignment: Alignment.center,
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "\n비가 오면 \n\n돈을 번다고?",
            body:"",
            image: _buildImage('pig'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "",
            body:"",
            image: _buildImage('how'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "",
            body:"",
            image: _buildThirdImage('logo2'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(),
        onSkip: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> TabPage())),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}