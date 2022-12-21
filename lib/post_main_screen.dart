import 'package:flutter/material.dart';
import 'package:sutt_task_2/traindetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
    Map<String, dynamic> mapdata = {
      "fromStationCode" : widget.journeyStart,
      "toStationCode" : widget.journeyEnd,
    };
    Uri uri = Uri.https('irctc1.p.rapidapi.com', '/api/v2/trainBetweenStations', mapdata);
    http.Response response;
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "fe0940c9admshd3dc04790844a4bp1fb8f9jsn801daefb401a",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
        print(listResponse);
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
      backgroundColor: Colors.yellow,
        appBar: AppBar(
          titleSpacing: 00.0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Trains',
            textAlign: TextAlign.center,
          ),
        ),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context, index){
          return Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(30.0,20.0,30.0,0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.train,
                                size: 30,
                                color: Colors.white,
                              ),
                              const Text(
                                "Train Number is ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                listResponse[index]['train_number'].toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.train,
                                size: 30,
                                color: Colors.white,
                              ),
                              const Text(
                                "Train Name is ",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                listResponse[index]['train_name'].toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                              child:
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TrainDetails(trainNo: listResponse[index]['train_number'] ),
                                      ));
                                },
                                child: const Text(
                                    "Get Details",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              )
                            ),
                          ],
                        ),
                      ],
                    )
                ),

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


// Container(
// child: Column(
// children: [
// Row(
// children: [

// ],
// ),





// IconButton(
// icon: const Icon(Icons.delete, color: Colors.white, size: 40.0),
// tooltip: 'Delete',
// onPressed: () {
// },
// ),


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


// Text(
// 'Text',

// ),