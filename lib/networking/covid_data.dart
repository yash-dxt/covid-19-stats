import 'package:covid_stats/models/covid_model.dart';
import 'package:covid_stats/networking/covid_api.dart';
import 'package:covid_stats/networking/covid_database.dart';
import 'package:flutter/cupertino.dart';

class CovidData with ChangeNotifier {
  CovidApi covidApi = CovidApi();

  List<CovidModel> userList = [];
  List<CovidModel> indiaList = [];
  bool a = false;

  int get userListLength => userList.length;

  void getIndiaList() {
    covidApi.getTotalCases().then((value) {
      indiaList = value;
      notifyListeners();
    });
  }

  void getUserList() {
    CovidDatabase.db.getUserList().then((value) {
      userList = value;
      notifyListeners();
    });
  }

  void addCovidModel(CovidModel covidModel) {
    if (userList.contains(covidModel) == false) {
      userList.add(covidModel);
      CovidDatabase.db.addToDatabase(covidModel);
    } else {
      print('already in list');
    }
    notifyListeners();
    print(userList.length);
  }

  void removeCovidModel(CovidModel covidModel) {
    userList.remove(covidModel);
    CovidDatabase.db.deleteCovidModelById(covidModel.state);
    notifyListeners();
    print(userList.length);
  }

  bool alreadyInList(CovidModel covidModel) {
    if (userList.contains(covidModel)) {
      return true;
    } else {
      return false;
    }
  }
}
