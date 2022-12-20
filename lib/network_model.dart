import 'package:sutt_task_2/networking.dart';



class NetworkModel {

  Future<dynamic> getTrainBetweenStations(String journeyStart,
      String journeyEnd) async {
    NetworkHelper1 networkHelper = NetworkHelper1(
        'https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations');

    var trainBetweenStationsData = await networkHelper.getData();
    return trainBetweenStationsData;
  }
}