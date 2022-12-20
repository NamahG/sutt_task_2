import 'package:flutter/material.dart';
import 'package:sutt_task_2/post_main_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sutt_task_2/constants.dart';


class TrainDetails extends StatefulWidget {
  TrainDetails({required this.trainNo});

  int trainNo;

  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

Map trainResponse = {};
List listResponse1 = [];


class _TrainDetailsState extends State<TrainDetails> {


  Future<dynamic> apiCall2() async {

    Map<String, dynamic> mapdat2 = {
      "trainNo" : widget.trainNo,
    };
    http.Response response;
    Uri uri = Uri.https('https://irctc1.p.rapidapi.com/','api/v1/getTrainSchedule', mapdat2);
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "99a822a504msh215305dc9d2e8d5p15ce89jsnc24452184367",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        trainResponse = json.decode(response.body);
        listResponse1 = trainResponse['data']['route'];
      });
    }
  }

  @override
  void initState() {
    apiCall2();
    super.initState();
  }

  TextEditingController stationInputTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFieldInputDecoration,
              controller: stationInputTEC,
            ),
          ),
          ListView.builder(itemBuilder: (context, index){
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Station Code is: ",
                      ),
                      Text(
                        listResponse1[index]['station_code'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Station Name is: ",
                      ),
                      Text(
                        listResponse1[index]['station_name'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Day it is passing through is: ",
                      ),
                      Text(
                        listResponse1[index]['day'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Distance from source is: ",
                      ),
                      Text(
                        listResponse1[index]['distance_from_source'].toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Will the train stop at the station or not: ",
                      ),
                      Text(
                        listResponse1[index]['stop'].toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
            itemCount: listResponse1.length ,
          ),
        ],
      )
    );
  }
}