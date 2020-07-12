import 'dart:async';

import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/screens/states_list_screen.dart';
import 'package:covid_stats/screens/user_list_screen.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CovidData covidData = CovidData();
    double widthOfDevice =  MediaQuery.of(context).size.width;
    print(widthOfDevice);

    return Consumer<List<CovidModel>>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: bg,
        body: (data == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : LiquidPullToRefresh(
                backgroundColor: orange,
                color: bg,
                onRefresh: () async {
                  Future.delayed(Duration(milliseconds: 500));
                },
                height: 60,
                showChildOpacityTransition: false,
                child: ListView(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            heroTag: 'bg2',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StatesListScreen(
                                          data: data, covidData: covidData)));
                            },
                            mini: true,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.format_align_right,
                              color: orange,
                              size: 20,
                            ),
                          ),
                          Text(
                            'INDIA',
                            style: TextStyle(
                                fontSize: 20,
                                color: orange,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold),
                          ),
                          FloatingActionButton(
                            heroTag: 'bg1',
                            onPressed: () {},
                            mini: true,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.wb_sunny,
                              size: 20,
                              color: orange,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerNeuSquare(
                              colourDark: red,
                              colourLight: Color(0xFFff5176),
                              status: 'Confirmed',
                              newNumber: '+' + data[0].newConfirmed,
                              totalNumber: data[0].confirmed,
                              x: -10.0,
                              y: -10.0, widthOfDevice:widthOfDevice ,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerNeuSquare(
                              x: 10.0,
                              y: -10.0,
                              colourDark: blue,
                              colourLight: Color(0xFF007bff),
                              status: 'Active',
                              newNumber: '',
                              totalNumber: data[0].active, widthOfDevice: widthOfDevice,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerNeuSquare(
                              x: -10.0,
                              y: 10.0,
                              colourDark: green,
                              colourLight: Color(0xFF73c685),
                              status: 'Recovered',
                              newNumber: '+' + data[0].newRecovered,
                              totalNumber: data[0].recovered, widthOfDevice: widthOfDevice,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ContainerNeuSquare(
                              x: 10.0,
                              y: 10.0,
                              colourDark: Color(0xFF6c757d),
                              colourLight: Color(0xFFa4a8ae),
                              status: 'Deceased',
                              newNumber: '+' + data[0].newDeaths,
                              totalNumber: data[0].deaths, widthOfDevice: widthOfDevice,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Container(
                    height: .35,
                    width: MediaQuery.of(context).size.width / 1.2,
                    color: orange,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 23,
                      ),
                      Text('Your States',
                          style: TextStyle(
                            fontSize: 20,
                            color: orange,
                            letterSpacing: 2,
                          )),
                      FloatingActionButton(
                        heroTag: 'herotag1',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserListScreen(covidData)));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: orange,
                        ),
                        mini: true,
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                    height: .35,
                    width: MediaQuery.of(context).size.width / 1.2,
                    color: orange,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
      );
    });
  }
}
