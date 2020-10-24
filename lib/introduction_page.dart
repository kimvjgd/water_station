import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  String videoURL_2017 = 'https://www.youtube.com/watch?v=lP_Bh6WFwPI&t=37s';
  String videoURL_2018 = 'https://www.youtube.com/watch?v=uqxtWo_ccGg';
  String videoURL_2019 = 'https://www.youtube.com/watch?v=05mmspbCwTo';
  String videoURL_2020 = 'https://www.youtube.com/watch?v=3BVRh4VK2zE';

  YoutubePlayerController _controller_2017;
  YoutubePlayerController _controller_2018;
  YoutubePlayerController _controller_2019;
  YoutubePlayerController _controller_2020;

  @override
  void initState() {
    _controller_2017 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2017),
      flags: YoutubePlayerFlags(
        autoPlay: false)

    );

    _controller_2018 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2018),
        flags: YoutubePlayerFlags(
            autoPlay: false)
    );

    _controller_2019 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2019),
    flags: YoutubePlayerFlags(
    autoPlay: false)
    );

    _controller_2020 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2020),
        flags: YoutubePlayerFlags(
            autoPlay: false)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.grey,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'Introduction',
      //     style: TextStyle(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      // ),ㅑ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('예측하기 힘든 기후변화로 인한 산간 농경지역의 물 부족과 이로 인한 피해가 날이 갈수록 증가하고 있습니다.\n',
                style: TextStyle(fontSize: 17 ),),
                Text('- 연평균 기온의 ↑ / 폭염일수 ↑: 농경지역의 증발손실 ↑',style: TextStyle(fontSize: 14 ,)),
                Text('- 강수량 ↑ 그러나 강우일수 ↓ : 필요한 시기의 강수량 부족',style: TextStyle(fontSize: 14 )),
                Text('- 지하수 부족',style: TextStyle(fontSize: 14 )),
                Text('- 수원과의 거리\n',style: TextStyle(fontSize: 14 )),

                Text('2020년 현재 지하수가 거의 나오지 않고 수원에서 멀리 떨어져 있는 산간 농경지역은 조선시대 때의 *천수답 과 다르지 않습니다. 또한 기후변화라는 주사위 던지기 게임 앞에 매년 기우제를 지내야 할지도 모릅니다.\n',style: TextStyle(fontSize: 17 )),
                Text('따라서 기후를 예측하고 대비하는 동시에 예측에 벗어난 가뭄이 닥쳐도 국가적 차원이 아닌 민간적 차원에서의 방안을 모색하는 것은 앞으로의 미래에 피할 수 없는 숙제입니다.\n',style: TextStyle(fontSize: 17 )),
                Text('워터스테이션은 이러한 기후변화로 인한 가뭄피해를 줄이며 농경지역의 가뭄피해의 사회적 관심을 증가시키기 위해 만들어졌다. 우리의 소중한 관심이 작게는 작은 농경지역, 마을, 도시 나아가 우리나라의 뉴스에 가뭄피해 관련 기사가 나오지 않는 시발점이 될 것이라 확신합니다.\n',style: TextStyle(fontSize: 17 )),
                Text('*천수답: 저수지나 강으로부터 물을 끌어대거나 지하수를 이용할 수 있는 시설이 전혀 없는 지역의 논으로서, 근래 한국은 수리개발사업을 꾸준히 추진하여 천수답의 면적을 크게 줄였다.\n',style: TextStyle(fontSize: 14),),


                SizedBox(height: 50,),
                Text(
                  '2017 년',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2017,
                )),
                SizedBox(height: 50,),
                Text(
                  '2018 년',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2018,
                )),
                SizedBox(height: 50,),
                Text(
                  '2019 년',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2019,
                )),
                SizedBox(height: 50,),
                Text(
                  '2020 년',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2020,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
