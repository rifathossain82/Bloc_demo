import 'dart:convert';

import 'package:bloc_demo/example2/My_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home_ex2 extends StatelessWidget {
  Home_ex2({Key? key}) : super(key: key);

    My_bloc my_bloc=My_bloc();

    TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter Name'
                ),
              ),
            ),
            StreamBuilder(
              stream: my_bloc.timeStream,
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Please Search');
                }
                if(snapshot.hasError){
                  return Text('Unable to fetch data.');
                }
                return Text('${snapshot.data}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.slideshow),
        onPressed: (){
          my_bloc.country_name=controller.text;
          my_bloc.eventSink.add(action.search);
        },
      ),
    );
  }

  DropdownMenuItem<String> buildItem(String item){
    return DropdownMenuItem(
        child: Text(item),
      value: '',
    );
  }


}
