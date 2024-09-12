// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, file_names

import 'package:country_time_app/classes/getdata-class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoding() async {
    AllCountries oneCountry = AllCountries(flag: 'egypt', countryName: 'Egypt', link: "Africa/Cairo");
    await oneCountry.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Color.fromARGB(255, 65, 51, 51),
              size: 100.0,
            )
          ],
        ),
      ),
    );
  }
}
