import 'package:http/http.dart' as http;
import 'dart:convert';

const String url1 = 'https://rest.coinapi.io/v1/exchangerate';
const apikey2 = '3B464D96-81FC-40E5-A06E-E0DB14D1D6D7';
const apikey = '35267C37-3BAF-458E-82E0-E70B8A5725DF';

class funtions {
  Future getmevalue(String coin, String cur) async {
    var url = Uri.parse('$url1/$coin/$cur?apikey=$apikey');
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      double price = data['rate'];
      return price;
    } else
      print(response.statusCode);
  }
}
