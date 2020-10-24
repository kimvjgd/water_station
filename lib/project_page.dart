import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cor_waterstation/invest_account.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

MapType map_type = MapType.normal;

class ProjectPage extends StatefulWidget {
  static final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(37.563713, 126.936924), zoom: 100);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Marker> allMarkers = [];
  GoogleMapController _controller;

  Future<void> _launched;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(36.768154, 126.217091)));
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch =
        'http://www.weather.go.kr/weather/forecast/digital_forecast.jsp?x=49&y=109&unit=K';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '워터스테이션 1호',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                    color: Colors.redAccent.shade700,
                    child: Text(
                      '투자하기',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvestAccount()));
                    },
                  ),
                  FlatButton(
                    color: Colors.redAccent.shade700,
                    child: Text(
                      '현재날씨',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => setState(() {
                      _launched = _launchInBrowser(toLaunch);
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // 좌측으로 붙힌다..
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• 위치 : 충청남도 태안군 소원면 영전 1리'),
                  Text('• 최대 집수량 : 150 톤'),
                  Text('• 집수 면적 : 300㎡m⁶'),
                  Text('* 기간 동안 목표 집수량 미달성 시 다음 프로젝트로 어쨋든 넘어감@@@ 나중에 고쳐야함'),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Accumulation(), // graph

            // 왼쪽으로
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1차 목표 집수량 120톤'),
                Text('기간 : 2020년 12월 1일 ~ 2021년 4월 30일'),
                Text('투자 기간 : 11월 30일까지'),
                Text('* 기간 동안 목표 집수량 미달성 시 다음 프로젝트로 어쨋든 넘어감@@@ 나중에 고쳐야함'),
              ],
            ),

            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 300,
                child:
                    Stack(alignment: AlignmentDirectional.topStart, children: [
                  Container(
                    height: 400,
                    width: 400,
                    child: GoogleMap(
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      tiltGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        new Factory<OneSequenceGestureRecognizer>(
                          () => new EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                      mapType: map_type,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(36.768154, 126.217091), zoom: 12.0),
                      markers: Set.from(allMarkers),
                      onMapCreated: mapCreated,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: movetoWaterStation,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green),
                        child: Icon(Icons.replay, color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: otherFunction,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red),
                        child: Icon(Icons.terrain, color: Colors.white),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Text(
              '시공 전',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.start,
            ),

            SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(child: _buildImage('project_1', 300, 150)),      // 여기의 height가 간격을 좌우한다.
                  Expanded(child: _buildImage('project_2', 300, 150)),
                ],
              ),
            ),

            SizedBox(height: 30,),

            Text(
              '시공 후',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(child: _buildImage('blacksheet', 300, 150)),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(child: _buildImage('blacksheet', 300, 150))
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoWaterStation() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(36.768154, 126.217091), zoom: 12.0),
    ));
  }

  otherFunction() {
    if (map_type == MapType.normal) {
      map_type = MapType.terrain;
    } else if (map_type == MapType.terrain) {
      map_type = MapType.satellite;
    } else if (map_type == MapType.satellite) {
      map_type = MapType.normal;
    }
    setState(() {});
  }
}

class Accumulation extends StatelessWidget {
  final List<Feature> features = [
    Feature(
      title: "현재 누적수량",
      color: Colors.blueAccent,
      data: [0.5, 0.3, 0.8, 0.7, 1, 0.64, 0.54],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "누적 집수량(12월)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: LineGraph(
              features: features,
              size: Size(500, 125),
              labelX: [
                '2020\n  1월',
                '2020\n  2월',
                '2020\n  3월',
                '2020\n  4월',
                '2020\n  5월',
                '2020\n  6월',
                '2020\n  7월'
              ],
              labelY: ['20%', '40%', '60%', '80%', '100%'],
              showDescription: false,
              graphColor: Colors.black54,
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

Widget _buildImage(String assetName, double image_width, double image_height) {
  return Align(
    child: Image.asset(
      'images/$assetName.png',
      width: image_width,
      height: image_height,
    ),
    alignment: Alignment.bottomCenter,
  );
}

// 일단 user 쏵 받아와
// 그리고 어떻게 해야할까..
// List_length설정해서 범위 걸어주고 일단 range를 fix해줘
// 여기까진 쉬울수도
// 쉽나.. LabelX 에 for로 늘려줄 수 있겠지 뭐.. 그치?

// range를 잡아주고 그 뒤에 데이터를 채워놔야하는데 가능하겠지?
// 일단 ++1을 해줘야 기본적으로 성공가능하고 그걸 firebase의 month와 비교를 해서 맞춰? 왓더 뻑이냐
// 이러면 데이터 소비가 장난이 아닐텐데.
// 일단 그냥 들고 오는지 부터 확인을 해봐야하는데..
// 만약 그냥 들고온다면 딱히 필요가 없고 근데  통신에 따라 어떻게 들고 오는지 다르지 않나? 흠..
// 일단 한번 해보자.
