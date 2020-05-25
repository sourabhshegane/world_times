import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;  //Location Name for UI
  String time; //Location Time
  String url;  //Actual URL for API Endpoint
  bool isDayTime;

  WorldTime({this.location, this.url});

  Future<void> getTime() async{
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMinutes = data['utc_offset'].substring(4, 6);

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));

      //Set Time Property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      print(e);
      time = "Something Went Wrong. Please try again" ;
    }
  }
}