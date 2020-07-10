import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/screens/states_list_screen.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<CovidModel>>(builder: (context, data, child) {
      CovidModel total = data[0];
      return Scaffold(
        backgroundColor: bg,
        body: (data == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
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
                            newNumber: '+' + total.newConfirmed,
                            totalNumber: total.confirmed,
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
                            totalNumber: total.active,
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
                            newNumber: '+' + total.newRecovered,
                            totalNumber: total.recovered,
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
                            newNumber: '+' + total.newDeaths,
                            totalNumber: total.deaths,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
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
                                builder: (context) => StatesListScreen(data)));
                      },
                      child: Icon(
                        Icons.add,
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
//                ContainerNeuLong(),
//                ContainerNeuLong(),
//                ContainerNeuLong()
              ]),
      );
    });
  }
}
