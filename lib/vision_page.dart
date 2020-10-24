import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VisionPage extends StatefulWidget {
  @override
  _VisionPageState createState() => _VisionPageState();
}

class _VisionPageState extends State<VisionPage> {

  String videoURL_2019 = 'https://www.youtube.com/watch?v=05mmspbCwTo';
  YoutubePlayerController _controller_2019;

  @override
  void initState() {
    _controller_2019 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2019),
        flags: YoutubePlayerFlags(
            autoPlay: false)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('워터스테이션은 매년 반복되는 가뭄으로부터 지속적인 피해를 입는 산간 농경지역에 농민들로부터 무상으로 공급받은 설계토지를 이용하여 무료로 농민들에게 빗물 집수 및 저수 시설을 확충하여 가뭄피해를 줄이는 사업입니다. 가뭄이 닥쳐도 보다 안정적인 농수 공급이 가능하도록 빗물을 효율적으로 집수 및 저수가 가능한 시설을 만들어 이로 인해 농민들이 하늘만 바라보며 한해 농사의 결실을 기다리는 일이 없게 하는 것이 워터스테이션의 근시적 목표입니다. 그 첫 삽으로 2020년 11월 첫 번째 워터스테이션이 태안군 소원면에 설치될 예정입니다.',
              style: TextStyle(fontSize: 14),),
              SizedBox(height: 20,),
              _buildImage('vision_1', 300.0, 300.0),
              SizedBox(height: 30,),
              _buildImage('vision_2', 150.0, 150.0),
              SizedBox(height: 40,),
              Container(
                color: Colors.black,
                height: 1,
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.black,
                height: 1,
              ),

              SizedBox(height: 40,),
              Text('워터스테이션은 여러분이 투자해준 금액의 일부(25%)로 만들어질 예정입니다.',
              style: TextStyle(fontSize: 14),),
              SizedBox(height: 40,),
              _buildImage('vision_3', 150.0, 150.0),
              SizedBox(height: 40,),
              Container(
                color: Colors.black,
                height: 1,
              ),
              SizedBox(height: 2,),
              Container(
                color: Colors.black,
                height: 1,
              ),
              SizedBox(height: 40,),
              Text('워터스테이션에 집수 된 물의 양에 따라 전체 투자액 75%이 반환될 것이며 반환 금액은 비가 오는 날마다 투자비율에 따라 일정 인원에게 반환될 것입니다. ',
                style: TextStyle(fontSize: 14),),
              SizedBox(height: 40,),
              _buildImage('vision_4', 150.0, 150.0),
              SizedBox(height: 40,),
              Container(
                  child: YoutubePlayer(
                    controller: _controller_2019,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildImage(String assetName, double height, double width) {

  double height;
  double width;

  return align(assetName, height, width);
}

Align align(String assetName, double height, double width) {
  return Align(
  child: Image.asset('images/$assetName.png',),
  alignment: Alignment.bottomCenter,
);
}
