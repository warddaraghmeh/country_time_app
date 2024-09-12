// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class AllCountries {
  final String flag;
  final String countryName;
  final String link;
  AllCountries(
      {required this.flag, required this.countryName, required this.link});
  late bool isDayTime;
  late String timeNow;
  late String timeZone;
  getData() async {
    Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedData = jsonDecode(response.body);
    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);
    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));
    DateTime realTime = dateTime.add(Duration(hours: offset));

    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat(("hh:mm a")).format(realTime);
    // print(timeNow);

    timeZone = receivedData["timezone"];
    // print(receivedData["timezone"]);
  }
}
