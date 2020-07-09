import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<CovidModel>>(builder: (context, data, child) {
      CovidModel total = data[0];
      return Scaffold(
        backgroundColor: bg,
        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'INDIA',
              style: TextStyle(
                  fontSize: 20,
                  color: orange,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
//          FloatingActionButton(
//            onPressed: () {},
//            backgroundColor: Colors.white,
//            mini: true,
//            child: Icon(
//
//              Icons.arrow_forward_ios,
//              color: Colors.orange,
//            ),
//
//          )
          ]),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerNeuSquare(
                      x: -10.0,
                      y: -10.0,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ContainerNeuSquare(x: 10.0, y: -10.0)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerNeuSquare(x: -10.0, y: 10.0),
                    SizedBox(
                      width: 20,
                    ),
                    ContainerNeuSquare(x: 10.0, y: 10.0),
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
                onPressed: () {},
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
          ContainerNeuLong(),
          ContainerNeuLong(),
          ContainerNeuLong()
        ]),
      );
    });
  }
}

class ContainerNeuLong extends StatelessWidget {
  const ContainerNeuLong({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFf0f2f5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(10, 10)),
          BoxShadow(
            color: Color.fromRGBO(206, 213, 222, 1),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }
}

class ContainerNeuSquare extends StatelessWidget {
  const ContainerNeuSquare(
      {@required this.x,
      @required this.y,
      this.colourDark,
      this.colourLight,
      this.status,
      this.newNumber,
      this.totalNumber});

  final double x, y;
  final Color colourDark;
  final Color colourLight;
  final String status;
  final String newNumber; //add + before this
  final String totalNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Confirmed',
            style: TextStyle(
                color: Color(0xFFff053a),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.3),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            '1,233',
            style: TextStyle(color: Color(0xFFff5176), letterSpacing: 1.2),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            '22,315',
            style: TextStyle(
                color: Color(0xFFff053a),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.3),
          ),
        ],
      ),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFf0f2f5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(x, y)),
          BoxShadow(
            color: Color.fromRGBO(206, 213, 222, 1),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
    );
  }
}
