import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterphone/Chat/chatListUser.dart';
import 'package:flutterphone/Inside_the_app/Comment.dart';
import 'package:flutterphone/Inside_the_app/List_worker_group.dart';
import 'package:flutterphone/Inside_the_app/WORKER_PROFILE.dart';
import 'package:flutterphone/USER/user_Profile.dart';
import 'package:flutterphone/Inside_the_app/user_order.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutterphone/constants.dart';
import '../buttom_bar.dart';
import '../constants.dart';
import '../database.dart';

String  name_Me="";
String  name="";
String  phone="";
String  image="";
String namefirst="";
String namelast="";
String Country="";
String  token="";
String IP4="192.168.2.8";

class State_order_accept extends StatefulWidget {
  final country;
  final namefirst;
  final namelast;
  final image;
  final phoneuser;
  final phoneworker;
  final description;
  final date;
  final time;
  final datesend;
  final dateaccept;
  final timesend;
  final timeaccept;
  State_order_accept({this.timeaccept,this.timesend,this.dateaccept,this.datesend,this.time,this.date,this.country,this.namefirst,this.namelast,this.image,this.phoneuser,this.phoneworker,this.description});
  _State_order_accept createState() =>  _State_order_accept();
}
class  _State_order_accept extends State<State_order_accept> {
  // AnimationController _animationController;
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final List1 = [];
  var ListDate1 = [];
  final List2 = [];
  var ListDate2 = [];
  var ListBlock=["8.00 - 9.00 ","9.00 - 10.00","","","",];
  var Listsearch=[];
  bool step1=true;
  bool step2=true;
  bool step3=false;
  bool step4=false;
  @override
  void initState() {
    super.initState();
    // getChat();
  }
  int _selectedIndex = 0;
  PageController _pageController;
  DatabaseMethods databaseMethods=new DatabaseMethods();
  Stream chatsRoom;
  @override
  int _selectedItem = 0;
  Widget build(BuildContext context) {
    print(Listsearch.toString());
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Directionality(textDirection: ui.TextDirection.rtl,
      child:Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            body: Form(
              // child:SingleChildScrollView(
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 100,
                    decoration: BoxDecoration(
                      // color:ca,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [G,A,B]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child:IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
                      Navigator.pop(context);
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => U_PROFILE(name_Me: widget.name_Me,)));
                    }),
                  ),
                  Container(
                    height: 200,
                    width: 400,
                    margin: EdgeInsets.only(top:120,right: 15,left: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child:Column(
                      children: [
                    Container(
                      margin: EdgeInsets.only(top:0,right: 10),
                      child:Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:10,right: 10),
                            child:CircleAvatar(backgroundImage: NetworkImage('https://'+IP4+'/testlocalhost/PHP/upload/'+widget.image),radius: 25.0,),),
                          Container(
                            margin: EdgeInsets.only(top:0,right: 10),
                            child: Text(widget.namefirst + " "+widget.namelast, style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                              fontFamily: 'Changa',
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 390,
                      margin: EdgeInsets.only(top:10,right:30),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.timer, color:MY_BLACK,),
                            SizedBox(width: 5,),
                            // Text(widget.date.toString(), style: TextStyle(
                            //   fontSize: 17,
                            //   fontWeight: FontWeight.w700,
                            //   color: Colors.grey[600],
                            //   fontFamily: 'Changa',
                            // ),),
                            SizedBox(width: 5,),
                            Text(widget.time, style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                              fontFamily: 'Changa',
                            ),),
                            Text(" "),
                            Text(widget=="am"?"??????????":"????????", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                              fontFamily: 'Changa',
                            ),),
                          ],
                        ),),
                    Container(
                      width: 400,
                      margin: EdgeInsets.only(right:40),
                      child: Text("???????????? ?????????? "+widget.description, style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[600],
                      fontFamily: 'Changa',
                    ),
                    ),
                    ),
                        Container(
                          margin: EdgeInsets.only(top: 2,right: 20),
                          child:Row(
                            children: [
                              Container(
                                width: 55,
                                //padding: EdgeInsets.symmetric(horizontal: 3),
                                child: FlatButton(
                                  onPressed: () {
                                   // UrlLauncher.launch("tel://0595320479");
                                  },
                                  child: new Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 23.0,
                                  ),
                                  shape: new CircleBorder(),
                                  color: D,
                                ),
                              ),
                              Container(
                                width: 55,
                                child: FlatButton(
                                  onPressed: () {
                                    //CreatChatRoom();
                                  },
                                  child: new Icon(
                                    Icons.mark_chat_unread,
                                    color: Colors.white,
                                    size: 23.0,
                                  ),
                                  shape: new CircleBorder(),
                                  color: D,
                                ),
                              ),
                              Container(
                                width: 55,
                                child: FlatButton(
                                  onPressed: () {
                                    //CreatChatRoom();
                                  },
                                  child: new Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 23.0,
                                  ),
                                  shape: new CircleBorder(),
                                  color: D,
                                ),
                              ),
                              // Container(
                              //   width: 50,
                              //
                              //   child: FlatButton(
                              //     onPressed: () {
                              //
                              //     },
                              //     child: new Icon(
                              //       Icons.arrow_forward,
                              //       color: Colors.white,
                              //       size: 23.0,
                              //     ),
                              //     shape: new CircleBorder(),
                              //     color: Colors.black12,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                   ],
                    ),
                  ),
                  Container(
                    height: 600,
                    width: 450,
                    // color:  Color(0xFFF3D657),
                    margin: EdgeInsets.only(top:350),
                    padding:EdgeInsets.only(right:25,left: 25),
                    decoration: BoxDecoration(
                      // color:Color(0xFF1C1C1C),
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(50),
                      //   topRight: Radius.circular(50),
                      // ),
                    ),
                    child:SingleChildScrollView(
                      child:Column(
                        children: [
                          GestureDetector(
                            // onTap: (){
                            //   print('fbfgbfbfb');
                            // },
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 350,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 10),
                                  child:Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top:5),
                                              alignment: Alignment.topRight,
                                              child:Icon(Icons.check_circle,size: 30,color: step1?Colors.green:Colors.grey,),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top:5),
                                              child:FDottedLine(
                                                color: Colors.green,
                                                height: 60.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('?????????? ??????????',
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('???? ?????? ?????????? ???????? ???? ?????????? ' + widget.datesend +'\n'+ "???? ???????????? "+ widget.timesend,
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black45,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            // onTap: (){
                            //   print('fbfgbfbfb');
                            // },
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 350,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 10),
                                  child:Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top:5),
                                              alignment: Alignment.topRight,
                                              child:Icon(Icons.check_circle,size: 30,color: step2?Colors.green:Colors.grey,),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top:0),
                                              child:FDottedLine(
                                                color: Colors.green,
                                                height: 60.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('?????????? ??????????',
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('???? ?????? ?????? ?????????? ???????? ???? ?????????? ' + widget.dateaccept +'\n'+ "???? ???????????? "+ widget.timeaccept,
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black45,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            // onTap: (){
                            //   print('fbfgbfbfb');
                            // },
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 350,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 10),
                                  child:Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top:5),
                                              alignment: Alignment.topRight,
                                              child:Icon(Icons.check_circle,size: 30,color: step3?Colors.green:Colors.grey,),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top:0),
                                              child:FDottedLine(
                                                color: Colors.green,
                                                height: 60.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('?????????? ???? ??????????',
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                          // Container(
                                          //   width: 300,
                                          //   margin: EdgeInsets.only(right: 10),
                                          //   child: Text('???? ?????? ?????? ?????????? ???????? ???? ?????????? ' + widget.datesend +'\n'+ "???? ???????????? "+ widget.timesend,
                                          //     style: TextStyle(
                                          //       fontFamily: 'Changa',
                                          //       color: Colors.black45,
                                          //       fontSize: 14.0,
                                          //       fontWeight: FontWeight.bold,
                                          //     ),),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            // onTap: (){
                            //   print('fbfgbfbfb');
                            // },
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 350,
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 10),
                                  child:Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top:5),
                                              alignment: Alignment.topRight,
                                              child:Icon(Icons.check_circle,size: 30,color: step4?Colors.green:Colors.grey,),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top:0),
                                              child:FDottedLine(
                                                color: Colors.green,
                                                height: 60.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(right: 10),
                                            child: Text('???????????????? ???? ??????????',
                                              style: TextStyle(
                                                fontFamily: 'Changa',
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                          ),
                                          // Container(
                                          //   width: 300,
                                          //   margin: EdgeInsets.only(right: 10),
                                          //   child: Text('???? ?????? ?????? ?????????? ???????? ???? ?????????? ' + widget.datesend +'\n'+ "???? ???????????? "+ widget.timesend,
                                          //     style: TextStyle(
                                          //       fontFamily: 'Changa',
                                          //       color: Colors.black45,
                                          //       fontSize: 14.0,
                                          //       fontWeight: FontWeight.bold,
                                          //     ),),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ),
                              ],
                            ),
                          ),



                        ],),),
                  ),],),),
          ),],),);
  }
}
class RecomendPlantCard extends StatelessWidget {
  RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    List<Colors> Color=[];
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10,right: 10),
      width: 160,
      height: 150,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child:Stack(
              children:<Widget>[
                // Icon(Icons.paint),
                Center(
                  child:Container(
                    height: 110,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple[400],Colors.purple[50]]
                      ),),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image, height: 90,
                        width: 100,
                        // color: Colors.white,
                        fit: BoxFit.contain,),
                    ),),),
                Container(
                  margin: EdgeInsets.only(top: 110),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,0.5),
                        blurRadius: 0.01,
                        color: Colors.grey,
                      ),
                    ],),
                  child:Center(
                    child:Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),),
              ],),
          ),
        ],),
    );
  }
}
class DataSearch extends SearchDelegate<String>{
  List<dynamic>list;
  var recentList=[];
  final name_Me;
  DataSearch({this.list,this.name_Me});
  Future getSearch()async{
    print(query);
    var a=query.split("  ");
    String name1=a[0];
    String name2=a[1];
    print(name1);
    print(name2);
    var url='https://'+IP4+'/testlocalhost/PHP/groupsearchname.php';
    var ressponse=await http.post(url,body: {
      "name1":name1,
      "name2":name2

    });
    // ignore: deprecated_member_use
    return json.decode(ressponse.body);
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){query="";})];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){});
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,

      ),
      onPressed: (){
        close(context, null);
      },);
    // return AppBar(
    //   backgroundColor: Colors.yellow,
    //   actions: [
    //   IconButton(
    //       icon: AnimatedIcon(
    //         icon: AnimatedIcons.menu_arrow,
    //         progress: transitionAnimation,
    //
    //       ),
    //       onPressed: (){
    //         close(context, null);
    //       },),
    //   ],
    // );
    throw UnimplementedError();
  }

  //String get searchFieldLabel => "??????????,";
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Directionality(textDirection: ui.TextDirection.rtl,
      child:SingleChildScrollView(
        child:Container(
          color:Colors.white,
          height: 700,
          padding: EdgeInsets.only(top:30),
          //  color:  Color(0xFF1C1C1C),
          child:FutureBuilder(
            future: getSearch(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data[index]['name'].toString());
                    print(snapshot.data[index]['phone'].toString());
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => user_worker(name_Me:name_Me,name:snapshot.data[index]['name'],namefirst:snapshot.data[index]['namefirst'],namelast:snapshot.data[index]['namelast'],phone:snapshot.data[index]['phone'],image:snapshot.data[index]['image'],Work:snapshot.data[index]['Work'],Experiance:snapshot.data[index]['Experiance'],Information:snapshot.data[index]['Information'],token:snapshot.data[index]['token'])),);
                    return Group(name_Me:name_Me,name:snapshot.data[index]['name'],namefirst:snapshot.data[index]['namefirst'],namelast:snapshot.data[index]['namelast'],phone:snapshot.data[index]['phone'],image:snapshot.data[index]['image'],Work:snapshot.data[index]['Work'],Experiance:snapshot.data[index]['Experiance'],Information:snapshot.data[index]['Information'],token:snapshot.data[index]['token']);
                    // return Container();
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),),),);
    return Text("SARA");
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    var search =query.isEmpty?recentList:list.where((p) => p.startsWith(query)).toList();
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child:Container(
        height: 200,
        margin: EdgeInsets.only(top: 50),
        child:ListView.builder(itemCount:search.length,itemBuilder: (context,i){
          return ListTile(leading: Icon(Icons.person),
              title: Text(search[i],
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Changa',
                  color: Color(0xFF666360),
                  fontWeight: FontWeight.bold,),
              ),

              onTap:(){
                query=search[i];
                recentList.add(query);
                showResults(context);
              }
          );
        }),),);
    throw UnimplementedError();
  }

}
class Group  extends StatefulWidget {
  final name_Me;
  final  name;
  final  namefirst;
  final  namelast;
  final  phone;
  final  image;
  final  Work;
  final  Experiance;
  final  Information;
  final  token;
  final double Rate;
  final namefirst_Me;
  final nameLast_Me;
  final phone_Me;
  final image_Me;

  Group({this.phone_Me,this.nameLast_Me,this.namefirst_Me,this.image_Me,this.Rate,this.name_Me,this.name,this.namefirst,this.namelast, this.phone, this.image, this.Work, this.Experiance, this.Information, this.token});

  @override
  _Group createState() => _Group();
}

class _Group extends State<Group> {
  @override
  void initState() {
    super.initState();
  }

  Future getImages() async {
    var url = 'https://' + IP4 + '/testlocalhost/PHP/Show_EXP.php';
    var ressponse = await http.post(url, body: {
      "phone": widget.phone,
    });
    // ignore: deprecated_member_use
    // var responsebody = json.decode(ressponse.body);
    // print(responsebody);
    return json.decode(ressponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          //color:Colors.white,
          color: Colors.white,
          // borderRadius: BorderRadius.circular(20),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 1),
          //     blurRadius: 20,
          //     color: Color(0xFFECCB45),
          //   ),
          // ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

        child: Column(
          children: <Widget>[
            Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 30, right: 10),
                child: CircleAvatar(backgroundImage: NetworkImage(
                    'https://' + IP4 + '/testlocalhost/PHP/upload/' + widget.image),
                  radius: 29.0,),),
              Container(
                width: 200,
                height: 30,
                //color: Colors.red,
                margin: EdgeInsets.only(top: 30, right: 80, left: 50),
                child: Text(widget.namefirst + " " + widget.namelast,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Changa',
                    color: Color(0xFF666360),
                    fontWeight: FontWeight.bold,
                  ),),),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:58,right: 80),
                    child: Text(widget.Rate.toString(),
                      style: TextStyle(
                        color: Color(0xFF666360),
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:58,right: 3, left: 15,),
                    child: Icon(Icons.star,
                      color: Colors.yellow,),
                  ),

                ],
              ),
              // Container(
              //   width: 200,
              //   margin: EdgeInsets.only(top: 70, right: 120),
              //   child: Text(widget.Work,
              //     style: TextStyle(
              //       fontSize: 18.0,
              //       fontFamily: 'Changa',
              //       color: Color(0xFF666360),
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),),

              Row(
                children: [
                  Directionality(textDirection: ui.TextDirection.ltr,
                    child:Container(
                      width: 110,
                      margin: EdgeInsets.only(top: 80, right: 70),
                      child: Text(widget.phone,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Changa',
                          color: Color(0xFF666360),
                          fontWeight: FontWeight.bold,
                        ),
                      ),),),
                  Container(
                    margin: EdgeInsets.only(top: 80, left: 10,),
                    child: Icon(Icons.phone,
                      color: Color(0xFF666360),),
                  ),
                  Container(
                    width: 57,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 80),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.transparent)
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      color:A,
                      onPressed: () async {
                        DateTime _selectedDay = DateTime.now();
                        var dateParse = DateTime.parse(_selectedDay.toString());
                        var formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDay);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => user_order(phone:widget.phone,),));
                      },
                      child: Center(child: Text("??????",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Changa',
                          color:  Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),),),
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(left: 0, right: 10, top: 80),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.transparent)
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      color:A,
                      onPressed: () async {

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => user_worker(image:widget.image,phone:widget.phone,name: widget.name,namelast:widget.namelast,name_Me: widget.name_Me,namefirst: widget.namefirst,token: widget.token,Information: widget.Information,Experiance:widget.Experiance,),));
                      },
                      child: Center(child: Text("?????? ????????????",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Changa',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),),),
                  ),
                ],),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    margin: EdgeInsets.only(right: 0, top: 87),
                    child: IconButton(

                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => comments(image:widget.image_Me,namelast:widget.nameLast_Me,namefirst: widget.namefirst_Me,Phoneuser: widget.phone_Me,Phoneworker: widget.phone,)));
                        // Navigator.of(context).push(comments);
                      },
                      icon: Icon(Icons.comment),
                    ),
                  ),
                  // Container(height: 20,
                  //     width: 40,
                  //     margin: EdgeInsets.only(right: 30, top: 100),
                  //     //child:Text("??????????")
                  // ),
                ],),
              //Container (margin: EdgeInsets.only(top: 20,left: 150),child:Text(widget.name),),
              // Row(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(top: 125,right: 150),
              //       child:Text("4.9"),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top: 120,right: 3,left: 15,),
              //       child:Icon(Icons.star),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top: 120,left: 0,right: 5),
              //       child:Text(" 123 ??????????"),
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(top: 120,right: 3,left: 90),
              //       child:Icon(Icons.comment),
              //     ),
              //
              //   ],
              // ),

            ],),
            Container(
              height: 10,
              margin: EdgeInsets.only(top: 5),
              child:Divider(
                color: Color(0xFF666360),
                thickness: 1,
              ),),

          ],),
      ),);
  }
}