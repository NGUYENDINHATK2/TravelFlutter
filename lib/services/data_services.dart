import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';

class DataServices {
  static const String baseUrl = 'https://mocki.io/v1';
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/008d9ff9-b071-4e12-8623-9fc8d58fb014';
    var url = baseUrl + apiUrl;
    http.Response res = await http.get(Uri.parse(url));
    try {
      if (res.statusCode == 200) {
        List<dynamic> datalist = json.decode(res.body);
        return datalist.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
