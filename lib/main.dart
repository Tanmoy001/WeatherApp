import 'package:flutter/material.dart';
import 'package:untitled/Activity/home.dart';
import 'package:untitled/Activity/loading.dart';

void main() {
  runApp(MaterialApp(

    routes: {
    "/":(context)=>const  Loading(),
      "/home":(context)=>const Home(),
      "/location":(context)=>const  Loading(),
    },
  ));

}

