import 'package:http/http.dart' as http;
import 'dart:convert';

class DetectArticalService{

  dynamic detectArtical(String article)async {
    final url =Uri.parse("http://10.0.2.2:5000/article");
    final response = await http.post(url, body: json.encode({'article' : article}));
    final decoded = json.decode(response.body) as Map<String, dynamic>;

    return decoded;
  }
}