import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

enum action{search,search_all}

class My_bloc{
  String time='';
  String country_name='';
  final _streamController=StreamController<String>();
  StreamSink<String> get timeSink=>_streamController.sink;
  Stream<String> get timeStream=>_streamController.stream;

  final _eventController=StreamController<action>();
  StreamSink<action> get eventSink=>_eventController.sink;
  Stream<action> get eventStream=>_eventController.stream;

  My_bloc(){
    eventStream.listen((event)async {
      if(event==action.search){
        await getData();
       timeSink.add(time);
      }
    });
  }

  Future<void> getData() async{
    try{
      Response response=await get(Uri.parse("http://worldtimeapi.org/api/timezone/${country_name}"));
      Map data=jsonDecode(response.body);

      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);

      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      time=now.toString();
    }
    catch(e){
      time='Unable to fetch data';
    }
  }


}