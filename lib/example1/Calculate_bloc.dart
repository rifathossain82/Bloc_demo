import 'dart:async';

enum option { add, sub, multiply, divide }

class Calculate_bloc {
  var x=0,y=0;
  //state stream controller
  final _streamController = StreamController<int>();

  StreamSink<int> get calculateSink => _streamController.sink;

  Stream<int> get calculateStream => _streamController.stream;

//event controller
  final _eventController = StreamController<option>();

  StreamSink<option> get eventSink => _eventController.sink;

  Stream<option> get eventStream => _eventController.stream;

  Calculate_bloc() {
    x=0;
    y=0;
    eventStream.listen((event) {
      if(event==option.add){
        x=x+y;
        calculateSink.add(x);
      }
      if(event==option.sub){
        x=x-y;
        calculateSink.add(x);
      }
      if(event==option.multiply){
        x=x*y;
        calculateSink.add(x);
      }
      if(event==option.divide){
        x=(x/y) as int;
        calculateSink.add(x);
      }
    });
  }
}
