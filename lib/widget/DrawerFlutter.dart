import 'package:WeatherApp/pages/homepage.dart';
import 'package:flutter/material.dart';

import '../utilityscreen.dart';

class DrawerFlutter extends StatefulWidget {
  @override
  _DrawerFlutterState createState() => _DrawerFlutterState();
}

class _DrawerFlutterState extends State<DrawerFlutter> {

  String dropdownValue = 'Jakarta, Indonesia';
  //int valuekota = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: valuekota == 0 ?  Color.fromRGBO(255, 184, 0, 1) : valuekota == 1 ? Color.fromRGBO(73, 98, 128, 1) : Color.fromRGBO(55, 71, 75, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(valuekota == 0 ? 'assets/img/sunnybg.png' : valuekota == 1 ? 'assets/img/cloudybg.png' : 'assets/img/stormybg.png' ))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(40),
                    height: ScreenUtil().setWidth(40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/foto.png"))),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(8),
                  ),
                  Text("AARAV ADILIO", style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.white,
                  ),),
                  Text("aaravadilio@email.com", style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.white,
                  ),),
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(16)
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Favorite Location", style: TextStyle(
                          fontSize: ScreenUtil().setSp(10),
                          color: Colors.white,
                        ),),
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(8),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.account_circle_rounded, color: Colors.white, size: ScreenUtil().setWidth(24),),
                  SizedBox(
                    width: ScreenUtil().setWidth(4),
                  ),
                  Text("Account Settings", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(14)
                  ),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(16), right: ScreenUtil().setWidth(16)),
              alignment: Alignment.center,
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.settings, color: Colors.white, size: ScreenUtil().setWidth(24),),
                  SizedBox(
                    width: ScreenUtil().setWidth(4),
                  ),
                  Text("Application Settings", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(14)
                  ),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(16), right: ScreenUtil().setWidth(16)),
              alignment: Alignment.center,
              child: Divider(
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.exit_to_app_sharp, color: Colors.redAccent, size: ScreenUtil().setWidth(24),),
                  SizedBox(
                    width: ScreenUtil().setWidth(4),
                  ),
                  Text("Logout", style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenUtil().setSp(14)
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
