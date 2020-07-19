import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/widgets/colors.dart';
import 'package:covid_stats/widgets/neu_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatesListScreen extends StatelessWidget {
  StatesListScreen({this.data, this.covidData});

  final List<CovidModel> data;
  final CovidData covidData;

  @override
  Widget build(BuildContext context) {
    double widthOfDevice = MediaQuery.of(context).size.width;
    double heightOfDevice = MediaQuery.of(context).size.height;
    List<CovidModel> data2 = data.sublist(1);
    print(widthOfDevice);
    return Scaffold(
      backgroundColor: bg,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'STATES',
                      style: TextStyle(
                          fontSize: 20,
                          color: orange,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
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
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length -1,
                  itemBuilder: (BuildContext context, int index) {
                    CovidModel element = data[index+1];
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
                        covidData.alreadyInList(element)
                            ? Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Already In Your List!')))
                            : covidData.addCovidModel(element);
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
