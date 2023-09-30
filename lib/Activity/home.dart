import 'dart:math';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai","Delhi","Indore","Kolkata","Ranchi"];
    final random =  Random();
    var city = city_name[random.nextInt(city_name.length)];
   Map<dynamic, dynamic>? info = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    String icon = (info?['icon'] ?? '//openweathermap.org/img/wn/10d@2x.png');
    String temp =(info?['temp_value'] ??'NA');
    String humidity =(info?['hum_value'] ?? 'NA');
    String airspeed =(info?['air_speed_value'] ??'NA');
    String description =(info?['des_value'] ??'NA');
    String main =(info?['main'] ?? 'NA');

    String name =(info?['name'] ?? 'NA');

    return  Scaffold(
      resizeToAvoidBottomInset:false ,
      appBar:PreferredSize(
        preferredSize:const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue.shade800,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                ]
              )
            ),
            child: Column(
              children: [
                Container(

                  padding:const EdgeInsets.symmetric(horizontal: 8),
                  margin:const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1
                    )

                  ),
                  child: Row(
                    children: [
                      GestureDetector(

                        onTap: (){
                          if((search.text).replaceAll(" ", "")==""){
                           debugPrint("blank");
                          }
                          else {
                            Navigator.pushReplacementNamed(context, "/location", arguments: {
                              "searchText": search.text,
                            });
                          }
                        },
                         child:Container(
                             margin:const EdgeInsets.fromLTRB(2, 0, 5, 0),

                             child: const Icon(Icons.search,color: Colors.blue,)),
                      ),
                      const SizedBox(width: 10),
                       Expanded(
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search '$city'",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)

                        ),
                        margin:const EdgeInsets.symmetric(horizontal: 13),
                      padding:const EdgeInsets.all(26),

                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [


                            Container(

                        padding:const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: Image.network("https:$icon")),
                            Container(

                              padding:const EdgeInsets.fromLTRB(30, 0, 10, 0),
                              child: Column(
                                children: [

                                   Text("$main",style: TextStyle(
                                    fontSize:(main.length < 8) ? 18 : 10,
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Text("in $name",style:const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),),
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                    ),

                  ],
                ),
                
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 198,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)

                        ),
                        margin:const EdgeInsets.symmetric(horizontal: 13,vertical: 8),
                        padding:const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.thermostat_outlined ,size: 40,color: Colors.blue,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp",style:const TextStyle(
                                  fontSize: 80,
                                ),),
                                const Text("C",style: TextStyle(
                                  fontSize: 30,
                                  
                                ),),
                              ],
                            )

                          ],
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)

                        ),
                        margin:const EdgeInsets.fromLTRB(13, 0, 5, 5),
                        padding:const EdgeInsets.all(26),
                        height: 180,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                           const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.wind_power_rounded,color: Colors.blue)
                              ],
                            ),
                            const SizedBox(height: 20),

                            Text("$airspeed",style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            )),
                           const Text("km/hr")


                          ],
                        )
                      ),
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)

                        ),
                        margin:const EdgeInsets.fromLTRB(5, 0, 13, 5),
                        height: 180,
                        padding:const EdgeInsets.all(26),
                          child: Column(

                            children: [

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.water_drop ,color: Colors.blue)
                                ],
                              ),
                              const SizedBox(height: 20),

                              Text("$humidity",style:const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              )),
                             const Text("Percent")


                            ],
                          )
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:const EdgeInsets.all(10),
                  padding:const EdgeInsets.all(20),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Tanmoy Chowdhury"),
                      Text("Data from openweathermap.org"),

                    ],

                  ),

                ),


              ],

            ),


          ),
        ),
      )

    );
  }
}
