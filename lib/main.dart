import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/screens/home_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CovidData data = CovidData();
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        var covidData = CovidData();
        covidData.getIndiaList();
        covidData.getUserList();
        return covidData;
      },
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
