import 'package:http/http.dart' as http;
import 'dart:convert';

class giveweatherdata {
  var url;
  giveweatherdata(this.url) {}
  var rtn;
  Future givedata() async {
    try {
      var url = await Uri.parse(this.url);
      http.Response response = await http.get(url);
      print(response);

      (response.statusCode == 200)
          ? rtn = jsonDecode(response.body)
          : rtn = response.statusCode;
      return rtn;
    } catch (e) {
      print(e);
    }
  }
}
