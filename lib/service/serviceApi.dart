import 'package:Postly/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
 static Future<dynamic> getRequest(String endpoint) async {

    try {
      http.Response response = await http.get(Uri.parse(BASE_URL + endpoint));
      print(response.body);
      if (response.statusCode == 200){
        return response.body;

      }else{
        return Exception("Server error!");
      }
    } catch(e){
     return Exception("Server error!");
    }
  }

 static Future<dynamic> postRequest({ @required String endpoint,
   @required dynamic body}) async {

   try {
     http.Response response = await http.post(Uri.parse(BASE_URL + endpoint),
         body: body);

     if (response.statusCode == 200){
       return response.body;
     }else{
       return Exception("Server error!");
     }
   } catch(e){
     print(e);
     return e;
   }
 }



}