import 'package:bloc_demo/example1/Calculate_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_ex1 extends StatelessWidget {
  Home_ex1({Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  final calculate_bloc = Calculate_bloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller1,
                decoration: InputDecoration(
                  hintText: 'Enter 1st value',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  hintText: 'Enter 2nd value',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: calculate_bloc.calculateStream,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Text('No Result Found.');
                    }
                    return Text(('Result : ${snapshot.data}'),style: TextStyle(fontSize: 22),);
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              if(controller1.text.isNotEmpty && controller2.text.isNotEmpty){
                calculate_bloc.x = int.parse(controller1.text);
                calculate_bloc.y = int.parse(controller2.text);
                calculate_bloc.eventSink.add(option.add);
              }
            },
            child: Icon(CupertinoIcons.add),
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              if(controller1.text.isNotEmpty && controller2.text.isNotEmpty){
                calculate_bloc.x = int.parse(controller1.text);
                calculate_bloc.y = int.parse(controller2.text);
                calculate_bloc.eventSink.add(option.sub);
              }
            },
            child: Icon(CupertinoIcons.minus),
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              if(controller1.text.isNotEmpty && controller2.text.isNotEmpty){
                calculate_bloc.x = int.parse(controller1.text);
                calculate_bloc.y = int.parse(controller2.text);
                calculate_bloc.eventSink.add(option.multiply);
              }
            },
            child: Icon(CupertinoIcons.multiply),
          ),
          SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              if(controller1.text.isNotEmpty && controller2.text.isNotEmpty){
                calculate_bloc.x = int.parse(controller1.text);
                calculate_bloc.y = int.parse(controller2.text);
                calculate_bloc.eventSink.add(option.divide);
              }
            },
            child: Icon(CupertinoIcons.divide),
          )
        ],
      ),
    );
  }
}
