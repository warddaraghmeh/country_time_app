// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:country_time_app/classes/getdata-class.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AllCountries> allCountries = [
    AllCountries(link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(link: 'Africa/Tunis', countryName: 'Tunisia - Tunis', flag: 'tunisia.png'),
    AllCountries(link: 'Africa/Algiers', countryName: 'Algeria - Algiers', flag: 'algeria.png'),
    AllCountries(link: 'Australia/Sydney', countryName: 'Australia - Sydney', flag: 'australia.png'),
    AllCountries(link: 'America/Toronto', countryName: 'Canada - Toronto', flag: 'canada.png'),
    AllCountries(link: 'Asia/Riyadh', countryName: 'Saudi Arabia - Riyadh', flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text(
            "Choose Location",
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          )),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: allCountries.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: ListTile(
              onTap: () async {
                AllCountries clickedCountry = allCountries[index];
                await clickedCountry.getData();
                Navigator.pop(context, {
                  "time": clickedCountry.timeNow,
                  "location": clickedCountry.timeZone,
                  "isDayTime": clickedCountry.isDayTime
                });
              },
              title: Text(
                allCountries[index].countryName,
                style: TextStyle(fontSize: 22, color: Colors.blueGrey),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${allCountries[index].flag}"),
              ),
            ),
          );
        },
      ),
    ));
  }
}
