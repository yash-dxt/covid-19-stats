import 'package:covid_stats/networking/covid_data.dart';
import 'package:covid_stats/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CovidData data = CovidData();
   return FutureProvider(
     create: (context) => data.getTotalCases(),
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HomeScreen()
     ),
   );
  }
}

