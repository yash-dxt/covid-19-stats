import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatesListScreen extends StatelessWidget {
  StatesListScreen( {this.data, this.userList});

  final List<CovidModel> data;
  final List<CovidModel> userList;

  @override
  Widget build(BuildContext context) {
    List<CovidModel> data2 = data.sublist(1);
    return Scaffold(
      backgroundColor: bg,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(children: [
              SizedBox(
                width: 160,
              ),
              Text(
                'STATES',
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
                heroTag: 'bg2',
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
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data2.length,
                  itemBuilder: (BuildContext context, int index) {
                    CovidModel element = data2[index];
                    return ContainerNeuLong(
                      heroTag: '$index' + 'aloo',
                      state: element.state,
                      newConfirmed: element.newConfirmed,
                      newRecovered: element.newRecovered,
                      newDeaths: element.newDeaths,
                      totalConfirmed: element.confirmed,
                      totalDeaths: element.deaths,
                      totalRecovered: element.recovered,
                      active: element.active,
                      function: () {
                        userList.add(element);
                      },
                      iconData: Icons.add,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
