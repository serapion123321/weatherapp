import 'package:WeatherApp/utilityscreen.dart';
import 'package:WeatherApp/widget/DrawerFlutter.dart';
import 'package:WeatherApp/widget/homepageappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownValue = 'Jakarta, Indonesia';
  int valuekota = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 414, height: 736)..init(context);

    return Scaffold(
        key: scaffoldKey,
        drawer: DrawerFlutter(),
        body: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage(valuekota == 0 ? 'assets/img/sunnybg.png' : valuekota == 1 ? 'assets/img/cloudybg.png' : 'assets/img/stormybg.png' ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil().setHeight(32),
                  left: ScreenUtil().setWidth(16),
                  right: ScreenUtil().setWidth(16)),
              child: Column(
                children: [
                  /// APP BAR
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: ScreenUtil().setWidth(32),
                                  color: Colors.white,
                                ),
                                onPressed: () =>
                                    scaffoldKey.currentState.openDrawer(),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(80),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "It will be cloudy but hot as hell today",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Colors.white)),
                                    Container(
                                      height: ScreenUtil().setHeight(25),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          dropdownColor: Colors.black,
                                          value: dropdownValue,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          ),
                                          iconSize: ScreenUtil().setWidth(12),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(12)),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              if(dropdownValue == "Jakarta, Indonesia"){
                                                valuekota = 0;
                                              } else if(dropdownValue == "Surabaya, Indonesia"){
                                                valuekota = 1;
                                              } else {
                                                valuekota = 2;
                                              }
                                            });
                                          },
                                          items: <String>[
                                            'Jakarta, Indonesia',
                                            'Surabaya, Indonesia',
                                            'Bali, Indonesia',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: ScreenUtil().setWidth(40),
                                height: ScreenUtil().setWidth(40),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage("assets/img/foto.png"))),
                              )
                            ]),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),

                  /// CARD WEATHER
                  Container(
                    height: ScreenUtil().setHeight(180),
                    width: ScreenUtil().setWidth(320),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: ScreenUtil().setHeight(32),
                              right: ScreenUtil().setWidth(24)),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: valuekota == 0 ? [
                                    Color.fromRGBO(255, 184, 0, 1),
                                    Color.fromRGBO(255, 214, 0, 1)
                                  ] : valuekota == 1 ? [
                                    Color.fromRGBO(73, 98, 128, 1),
                                    Color.fromRGBO(118, 141, 174, 1)
                                  ] : [
                                    Color.fromRGBO(55, 71, 75, 1),
                                    Color.fromRGBO(55, 71, 75, 1)
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(120),
                          child: Container(
                            margin: EdgeInsets.all(ScreenUtil().setWidth(8)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(60),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        valuekota == 0 ? "32" + "\u00B0" : valuekota == 1 ? "28" + "\u00B0" : "24" + "\u00B0",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(54),
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil().setWidth(8),
                                      ),
                                      Text(
                                        "Celcius",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(18),
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "but feels like ",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(12),
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "39 ",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(12),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Celcius ",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(4),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "05 Dec 2020 ",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(12),
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "at 09.41 am",
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          height: ScreenUtil().setHeight(120),
                          width: ScreenUtil().setWidth(150),
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage(valuekota == 0 ? 'assets/img/sunnyday.png' : valuekota == 1 ? 'assets/img/windy.png' : 'assets/img/storm.png'),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Column SunRise, sunset, dll
                  Container(
                    height: ScreenUtil().setHeight(58),
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/img/sunrise.png"),
                              height: ScreenUtil().setHeight(32),
                              width: ScreenUtil().setWidth(32),
                            ),
                            Text(
                              "05.30 am",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: ScreenUtil().setHeight(64),
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/img/sunrise.png"),
                              height: ScreenUtil().setHeight(32),
                              width: ScreenUtil().setWidth(32),
                            ),
                            Text(
                              "06.00 pm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: ScreenUtil().setHeight(64),
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/img/sunrise.png"),
                              height: ScreenUtil().setHeight(32),
                              width: ScreenUtil().setWidth(32),
                            ),
                            Text(
                              "12 km / h",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: ScreenUtil().setHeight(64),
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("assets/img/sunrise.png"),
                              height: ScreenUtil().setHeight(32),
                              width: ScreenUtil().setWidth(32),
                            ),
                            Text(
                              "10 %",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(12),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  /// Weather Forecast
                  SizedBox(
                    height: ScreenUtil().setHeight(16),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: ScreenUtil().setHeight(300),
                    width: ScreenUtil().setWidth(340),
                    child: Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(8),
                          bottom: ScreenUtil().setHeight(8),
                          left: ScreenUtil().setWidth(8),
                          right: ScreenUtil().setWidth(8)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Weather Forecast", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenUtil().setSp(24)
                              ),),
                              Icon(Icons.list, size: ScreenUtil().setHeight(36), color: Colors.white,)
                            ],
                          ),
                          ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {
                             return Divider(
                                color: Colors.white,
                                thickness: 2,
                              );
                            }   ,
                            shrinkWrap: true,
                            itemCount:4,
                            itemBuilder: (BuildContext context, int index) {
                             return Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Monday", style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: ScreenUtil().setSp(14)
                                            ),),
                                            Text("07 December 2020", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: ScreenUtil().setSp(14)
                                            ),)
                                          ],
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("27" + "\u2103" + " / " + "11" + "\u2109",  style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: ScreenUtil().setSp(14)
                                              ),),
                                              Image(image: AssetImage("assets/img/sunnyday.png"), height: ScreenUtil().setHeight(24),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              );
                            },


                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
