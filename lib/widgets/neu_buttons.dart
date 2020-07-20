import 'package:covid_stats/widgets/colors.dart';
import 'package:flutter/material.dart';

class ContainerNeuSquare extends StatelessWidget {
  const ContainerNeuSquare({
    @required this.x,
    @required this.y,
    @required this.colourDark,
    @required this.colourLight,
    @required this.status,
    @required this.newNumber,
    @required this.totalNumber,
    @required this.widthOfDevice,
  });

  final double x, y;
  final Color colourDark;
  final Color colourLight;
  final String status;
  final String newNumber; //add + before this
  final String totalNumber;
  final double widthOfDevice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            status,
            style: TextStyle(
                color: colourDark,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.3),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            newNumber,
            style: TextStyle(color: colourLight, letterSpacing: 1.2,  ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            totalNumber,
            style: TextStyle(
                color: colourDark,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.3),
          ),
        ],
      ),
      width: widthOfDevice / 2.7,
      height: widthOfDevice / 2.7,
      decoration: BoxDecoration(
        color: Color(0xFFf0f2f5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              blurRadius: widthOfDevice / 25,
              spreadRadius: widthOfDevice / 45,
              offset: Offset(x, y)),
          BoxShadow(
            color: Color.fromRGBO(206, 213, 222, 1),
            blurRadius: widthOfDevice / 25,
            spreadRadius: widthOfDevice / 45,
          ),
        ],
      ),
    );
  }
}

class ContainerNeuLong extends StatelessWidget {
  const ContainerNeuLong({
    Key key,
    @required this.function,
    @required this.state,
    @required this.heroTag,
    @required this.newConfirmed,
    @required this.newRecovered,
    @required this.newDeaths,
    @required this.totalConfirmed,
    @required this.totalRecovered,
    @required this.totalDeaths,
    @required this.active,
    @required this.iconData,
  }) : super(key: key);
  final String state;
  final String heroTag;
  final String newConfirmed;
  final String newRecovered;
  final String newDeaths;
  final String totalConfirmed;
  final String totalRecovered;
  final String totalDeaths;
  final String active;
  final Function function;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                state == null ? 'State' : state,
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                    color: orange),
              ),
            ),
            FloatingActionButton(
              backgroundColor: bg,
              heroTag: heroTag + 'a',
              onPressed: function,
              child: Icon(
                iconData,
                color: orange,
              ),
              mini: true,
            )
          ]),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallBlockForNeu(
                    colour: red,
                    status: 'Confirmed',
                    newAdded: newConfirmed,
                    total: totalConfirmed,
                  ),
                  SmallBlockForNeu(
                    colour: blue,
                    status: 'Active',
                    total: active,
                  ),
                  SmallBlockForNeu(
                    colour: green,
                    status: 'Recovered',
                    newAdded: newRecovered,
                    total: totalRecovered,
                  ),
                  SmallBlockForNeu(
                    colour: gray,
                    status: 'Deaths',
                    newAdded: newDeaths,
                    total: totalDeaths,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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

class SmallBlockForNeu extends StatelessWidget {
  const SmallBlockForNeu({
    this.status,
    this.newAdded,
    this.total,
    Key key,
    this.colour,
  }) : super(key: key);
  final String status, newAdded, total;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: colour, letterSpacing: 1.2, );
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(status, style: style),
          SizedBox(
            height: 7,
          ),
          Text(
            newAdded == null ? '' : '+' + newAdded,
            style: style,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            total == null ? '' : total,
            style: style,
          )
        ],
      ),
    );
  }
}
