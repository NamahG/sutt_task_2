import 'package:flutter/material.dart';
import 'package:sutt_task_2/post_main_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sutt_task_2/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class TrainDetails extends StatefulWidget {
  TrainDetails({required this.trainNo});


  String trainNo;

  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

Map trainResponse = {};
List listResponse1 = [];


class _TrainDetailsState extends State<TrainDetails> {

  bool isLoading = false;
  Future<dynamic> apiCall2() async {
    isLoading = true;
    Map<String, dynamic> mapdat2 = {
      "trainNo" : widget.trainNo,
    };
    http.Response response;
    Uri uri = Uri.https('irctc1.p.rapidapi.com','api/v1/getTrainSchedule',mapdat2);
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "fea99748bbmshf72995184f86bc5p1a1e2ejsn921c76484118",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        trainResponse = json.decode(response.body);
        listResponse1 = trainResponse['data']['route'].toList();
        print(listResponse1);
        isLoading = false;
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
  Widget build(BuildContext context) => isLoading
      ? Scaffold(
         body: Center(
           child: SpinKitCubeGrid(
             size: 140,
             color: Colors.white,
           ),
         ),
       )
     : Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          titleSpacing: 00.0,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Trains',
            textAlign: TextAlign.center,
          ),
        ),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
          child: Column(
            children: [
              Row(

                children: [
                  Icon(
                    Icons.code,
                    size: 20,
                    color: Colors.white,
                  ),
                  const Text(
                    "Station Code is: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    listResponse1[index]['station_code'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.dns,
                    size: 20,
                    color: Colors.white,
                  ),
                  const Text(
                    "Station Name is: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        listResponse1[index]['station_name'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Colors.white,
                  ),
                  const Text(

                    "Day it is passing through is: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    listResponse1[index]['day'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.social_distance,
                    size: 20,
                    color: Colors.white,
                  ),
                  const Text(
                    "Distance from source is: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    listResponse1[index]['distance_from_source'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.verified,
                    size: 20,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: const Text(
                        "Will train stop at the station:",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        listResponse1[index]['stop'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
        itemCount: listResponse1.length ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );

}

// Container(
// padding: const EdgeInsets.all(20.0),
// child: TextFormField(
// style: const TextStyle(
// color: Colors.black,
// ),
// decoration: kTextFieldInputDecoration,
// controller: stationInputTEC,
// ),
// ),