import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared/main.dart';

class Screen extends StatelessWidget
{
  const Screen({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold(
      body: SafeArea(
        child: Column(children:
         [
          Text(
          counter.toString(),
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        ElevatedButton(
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(
               //переход на другу страницу(класс)
            builder: (context) => MyHomePage(title: 'Title')));
          },
          child: Text("Назад"))
         ],),
      ),
    );
  }



}