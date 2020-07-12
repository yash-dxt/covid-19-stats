import 'dart:async';
import 'dart:convert';
import 'package:covid_stats/models/covid_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CovidData with ChangeNotifier {
  List<CovidModel> userList = [];
  bool a = false;

  String url = 'https://api.covid19india.org/data.json';
  int get userListLength => userList.length;



  bool alreadyInList(CovidModel covidModel){
    if(userList.contains(covidModel)){
      return true;
    }
    else{
      return false;
    }
  }
  void addCovidModel(CovidModel covidModel){
    if(userList.contains(covidModel)== false){
      userList.add(covidModel);

    }else{
      print('already in list');
    }
    notifyListeners();
    print(userList.length);
  }

  void removeCovidModel(CovidModel covidModel){
    userList.remove(covidModel);
    notifyListeners();
    print(userList.length);
  }

  Future<List<CovidModel>> getTotalCases() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      List<dynamic> data = decodedData['statewise'] as List;
      List<CovidModel> list = data.map((e) => CovidModel.fromJson(e)).toList();
      return list;
    } else {
      throw 'error';
    }
  }
}
