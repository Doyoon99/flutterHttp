// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//   void main() async {
//
//     var url =
//     Uri.https('172.10.1.181:8080', '/api/promise');
//
//     // String url = "http://172.10.1.181:8080/api/promise";
//     var response = await http.get(url);
//     var statusCode = response.statusCode;
//     var responseHeaders = response.headers;
//     var responseBody = response.body;
//
//     print("hello");
//     print("statusCode: ${statusCode}");
//     print("responseHeaders: ${responseHeaders}");
//     print("responseBody: ${responseBody}");
//
//     //runApp(MyApp());
//   }

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
