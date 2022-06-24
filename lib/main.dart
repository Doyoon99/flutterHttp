import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';
import 'package:cp949/cp949.dart' as cp949;

Future<void> main() async {
  final client = RetryClient(http.Client());
  var responsebody;
  List<int> body;
  try {
    responsebody =
    // http://본인 ip주소/api/matching
    // http://본인 ip주소/api/promise
    // http://본인 ip주소/api/register
    (await client.read(Uri.parse('http://ip주소/api/promise')));
    // body = jsonDecode(responsebody);
    body = utf8.encode(responsebody);
  } finally {
    client.close();
  }
  String value = utf8.decode(body);
  print(value);
}
