class CovidModel {
  final String state;
  final String confirmed;
  final String active;
  final String deaths;
  final String recovered;
  final String lastDate;
  final String newConfirmed;
  final String newDeaths;
  final String newRecovered;

  CovidModel(
      {this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.state,
      this.confirmed,
      this.active,
      this.deaths,
      this.recovered,
      this.lastDate});

  factory CovidModel.fromJson(Map<String, dynamic> json) {
    return CovidModel(
        state: json['state'],
        confirmed: json['confirmed'],
        active: json['active'],
        deaths: json['deaths'],
        recovered: json['recovered'],
        newConfirmed: json['deltaconfirmed'],
        newDeaths: json['deltadeaths'],
        newRecovered: json['deltarecovered']);
  }

  Map<String, dynamic> toMap() => {
        'state': state,
        'confirmed': confirmed,
        'active': active,
        'deaths': deaths,
        'recovered': recovered,
        'deltaconfirmed': newConfirmed,
        'deltadeaths': newDeaths,
        'deltarecovered': newRecovered
      };
}
