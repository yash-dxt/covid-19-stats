import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen(this.covidData);

  final CovidData covidData;

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(children: [
          SizedBox(
            width: 100,
          ),
          Text(
            'Your States ',
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
            heroTag: 'herotag1',
            onPressed: () {
              Navigator.pop(context);
            },
            mini: true,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: orange,
            ),
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.covidData.userListLength,
              itemBuilder: (BuildContext context, int index) {
                CovidModel element = widget.covidData.userList[index];
                return ContainerNeuLong(
                  iconData: Icons.remove,
                  heroTag: '$index' + 'aloo2',
                  state: element.state,
                  newConfirmed: element.newConfirmed,
                  newRecovered: element.newRecovered,
                  newDeaths: element.newDeaths,
                  totalConfirmed: element.confirmed,
                  totalDeaths: element.deaths,
                  totalRecovered: element.recovered,
                  active: element.active,
                  function: () {
                    setState(() {
                      widget.covidData.removeCovidModel(element);
                    });
                  },
                );
              }),
        ),
      ],
    ));
  }
}
