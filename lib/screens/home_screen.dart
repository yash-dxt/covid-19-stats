import 'dart:async';

import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/screens/states_list_screen.dart';
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
    return Consumer<List<CovidModel>>(builder: (context, data, child) {
      final snackBar = SnackBar(
        content: Text('Yay! A SnackBar!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
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
                  Phoenix.rebirth(context);
                },
                height: 60,
                showChildOpacityTransition: false,
                child: ListView(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      heroTag: 'bg2',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatesListScreen(data)));
                      },
                      mini: true,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.format_align_right,
                        color: orange,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 105,
                    ),
                    Text(
                      'INDIA',
                      style: TextStyle(
                          fontSize: 20,
                          color: orange,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 105,
                    ),
                    FloatingActionButton(
                      heroTag: 'bg1',
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                      mini: true,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.wb_sunny,
                        size: 20,
                        color: orange,
                      ),
                    )
                  ]),
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
                              y: -10.0,
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
                              totalNumber: data[0].active,
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
                              totalNumber: data[0].recovered,
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
                              totalNumber: data[0].deaths,
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
                      child: Text(
                    'Stay Safe!',
                    style: TextStyle(
                        color: orange, letterSpacing: 1.5, fontSize: 20),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    '( more updates coming soon )',
                    style: TextStyle(
                        color: orange, letterSpacing: 1.5, fontSize: 12),
                  ))

//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: [
//                      SizedBox(
//                        width: 23,
//                      ),
//                      Text('Your States',
//                          style: TextStyle(
//                            fontSize: 20,
//                            color: orange,
//                            letterSpacing: 2,
//                          )),
//                      FloatingActionButton(
//                        heroTag: 'herotag1',
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) =>
//                                      StatesListScreen(data)));
//                        },
//                        child: Icon(
//                          Icons.add,
//                          color: orange,
//                        ),
//                        mini: true,
//                        backgroundColor: Colors.white,
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                  Center(
//                      child: Container(
//                    height: .35,
//                    width: MediaQuery.of(context).size.width / 1.2,
//                    color: orange,
//                  )),
//                  SizedBox(
//                    height: 20,
//                  ),
//                ContainerNeuLong(),
//                ContainerNeuLong(),
//                ContainerNeuLong()
                ]),
              ),
      );
    });
  }
}
