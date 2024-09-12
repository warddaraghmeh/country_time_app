// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map RightTime = {};
  @override
  Widget build(BuildContext context) {
    RightTime = RightTime.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : RightTime;
    //*Note: the RightTime that data come from loading components {"time":timeNOW&& "location":timezone , "IsDayTime": IsDayTime,}
    String bgimg = RightTime["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgimg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic reslut =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if (reslut == null) {
                      RightTime = {
                        "time": "..:..",
                        "location": "please choose a location ",
                        "isDayTime": false
                      };
                    } else {
                      RightTime = {
                        "time": reslut["time"],
                        "location": reslut["location"],
                        "isDayTime": reslut["isDayTime"]
                      };
                    }
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.white,
                  size: 24.0,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueAccent,
                  ),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Text(RightTime["time"],
                        style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 12),
                    Text(RightTime["location"],
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
