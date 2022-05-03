class LocationCardModel {
  late final String location;
  late final String time;
  late final String summary;
  late final String temp;
  late final String high;
  late final String low;

  LocationCardModel(
      this.location, this.time, this.summary, this.temp, this.high, this.low);

  factory LocationCardModel.fromJson(Map<String, dynamic> json) {
    return LocationCardModel("Lagos", "11:30", "Haze", "33", "35", "15");
  }
}
