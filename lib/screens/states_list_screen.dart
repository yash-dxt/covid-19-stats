import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/material.dart';

class StatesListScreen extends StatelessWidget {
  StatesListScreen(this.data);

  final List<CovidModel> data;

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
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                      return ContainerNeuLong(
                        heroTag: '$index',
                        state: data2[index].state,
                        newConfirmed: data2[index].newConfirmed,
                        newRecovered: data2[index].newRecovered,
                        newDeaths: data2[index].newDeaths,
                        totalConfirmed: data2[index].confirmed,
                        totalDeaths: data2[index].deaths,
                        totalRecovered: data2[index].recovered, active: data2[index].active,
                      );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
