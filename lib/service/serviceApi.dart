import 'package:Postly/utils/config.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
 static Future<dynamic> getRequest(String endpoint) async {

    try {
      http.Response response = await http.get(Uri.parse(BASE_URL + endpoint));

      if (response.statusCode == 200){
        return response.body;
      }else{
        throw Exception("Server error!");
      }
    } catch(e){
     throw Exception("Server error!");
    }
  }

 static Future<dynamic> postRequest(String endpoint, dynamic body) async {

   try {
     http.Response response = await http.post(Uri.parse(BASE_URL + endpoint), body: body);

     if (response.statusCode == 200){
       return response.body;
     }else{
       throw Exception("Server error!");
     }
   } catch(e){
     throw Exception("Server error!");
   }
 }



}