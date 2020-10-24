import 'package:flutter/material.dart';

class InvestAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(height: 40,),
            Text('예금주 : 워터스테이션\n'),
            Text('거래은행 : 국민은행\n'),
            Text('계좌번호 : 3333-00-@@@@@@@@\n'),

            // boundary
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(' * 입금 후 업데이트까지 최대 1일 소요될 수 있음.\n'),
            Text('문의 \n'),
            Text('번호 : 010 - 3090 - 4522'),
            Text('kakao ID : tae4522'),
            Text('Email : waterstation.corpor@gmail.com'),
              ],
            ),

            SizedBox(height: 50,),
            Text('*송금 시 반드시 로그인에 기입한 이름, google, 또는 휴대번호를 기입해주세요.',
            style: TextStyle(fontSize: 12),),

          ],
        ),
      ),
    );
  }
}
