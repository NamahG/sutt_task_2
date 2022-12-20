import 'package:flutter/material.dart';
import 'package:sutt_task_2/traindetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sutt_task_2/main_screen.dart';


Map mapResponse = {};
List listResponse = [];


class TrainData extends StatefulWidget {
  TrainData({required this.journeyStart,required this.journeyEnd});

  String journeyStart;
  String journeyEnd;

  @override
  State<TrainData> createState() => _TrainDataState();
}

class _TrainDataState extends State<TrainData> {
  Future<dynamic> apiCall1() async {
    Map<String, dynamic> mapdat = {
      "fromStationCode" : widget.journeyStart,
      "toStationCode" : widget.journeyEnd,
    };
    Uri uri = Uri.https('irctc1.p.rapidapi.com/', '/api/v2/trainBetweenStations', mapdat);
    http.Response response;
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "99a822a504msh215305dc9d2e8d5p15ce89jsnc24452184367",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }


  @override
  void initState() {
    apiCall1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index){
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Train Number is ",
                    ),
                    Text(
                      listResponse[index]['train_number'].toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Train Name is ",
                    ),
                    Text(
                      listResponse[index]['train_name'].toString(),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainDetails(trainNo: listResponse[index]['train_number'] ),
                        ));
                  },
                  child: Text(
                      "Get Details"
                  ),
                )
              ],
            ),
          );
        },
        itemCount: listResponse.length ,
        ),
      )
    );
  }
}


// listResponse == null? 0 :
// class TrainDat {
//   TrainDat({required this.journeyStart,required this.journeyEnd});
//
//   String journeyStart;
//   String journeyEnd;
//
//   Future<dynamic> getTrainBetweenStations(String journeyStart, String journeyEnd) async {
//     NetworkHelper networkHelper = NetworkHelper(
//         'https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations');
//
//     var trainBetweenStationsData = await networkHelper.getData();
//     return trainBetweenStationsData ;
//   }
// }

// Future<dynamic> getTrainBetweenStations(String journeyStart, String journeyEnd) async {
//   NetworkHelper1 networkHelper = NetworkHelper1(
//       'https://irctc1.p.rapidapi.com/api/v2/trainBetweenStations');
//
//   var trainBetweenStationsData = await networkHelper.getData();
//   return trainBetweenStationsData ;
// }