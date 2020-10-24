import 'package:cor_waterstation/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int List_Length = 0;
dynamic data_investor = [];
int total_investment = 0;
int index_person;

// @@@@@@@@@@@@@@@@@@ 실시간 업뎃은 dongstagram clone _ 1 searchPage _buildbody를 참조하면 될꺼같다.

class InvestmentPage extends StatefulWidget {
  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    user.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  '${user.userInfo[index_person].name}의 투자금액은 ${user.userInfo[index_person].invest_amount}'),
              Text(
                '총 누적 투자 금액',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '${total_investment} 원',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 5,
              ),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('person').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        total_investment = 0;
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          var items =
              snapshot.data.documents ?? []; // 내용이 없어도 null이 안되고 []공백이된다..
          List_Length = user.userInfo.length;
          data_investor = items;
          print('${List_Length}::List_Length');
          return _getBodyWidget();
        }
      }, // post밑에 파일들이 변경되면 그 흐름이 들어온다.
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 450,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFEE),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {});
        },
      ),
      _getTitleItemWidget('Invest_Amount', 150),
      _getTitleItemWidget('Invest_Date', 150),
      _getTitleItemWidget('Description', 150),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(user.userInfo[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(user.userInfo[index].invest_amount.toString()),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(user.userInfo[index].invest_date),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(user.userInfo[index].description),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> _userInfo = List<UserInfo>();

  void initData() {
    _userInfo.clear();
    for (int i = 0; i < List_Length; i++) {
      if(data_investor[i]['invest_amount']!=0) {
        _userInfo.add(UserInfo(
          data_investor[i]['name'],
          data_investor[i]['invest_amount'],
          data_investor[i]['invest_date'],
          data_investor[i]['description'],
          data_investor[i]['email'],
        ));
      }
        // if(data_investor[i]['invest_amount']!=0){
        //   print(data_investor[i]['name']);
        // }
        total_investment += data_investor[i]['invest_amount'];
        if (data_investor[i]['email'] == email) {
          index_person = i;
    }
      }
      print('${user.userInfo.length}::user.userInfo.length');
  }

  List<UserInfo> get userInfo => _userInfo;

  set userInfo(List<UserInfo> value) {
    _userInfo = value;
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    _userInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('', ''));
      int bId = int.tryParse(b.name.replaceFirst('', ''));
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }
}

class UserInfo {
  String name;
  int invest_amount;
  String invest_date;
  String description;
  String email;

  UserInfo(this.name, this.invest_amount, this.invest_date, this.description,
      this.email);
}
