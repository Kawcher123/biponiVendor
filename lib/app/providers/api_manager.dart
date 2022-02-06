import 'dart:convert';
import 'dart:io';

import 'package:biponi_vendor/app/providers/customExceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class APIManager {
  Future<dynamic> postAPICallWithHeader(String url, Map param, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: headerData);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(String url, Map<String, String> param, var images, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);

      print('fgdf');

      for (var item in images) {
        String fileName = item.path.split("/").last;
        var stream = http.ByteStream(item.openRead());

        stream.cast();

        print(stream);
        // get file length

        var length = await item.length(); //imageFile is your image file

        // multipart that takes file
        var multipartFileSign = await http.MultipartFile('files[]', stream, length, filename: fileName);

        request.files.add(await multipartFileSign);
      }
      request.headers.addAll(headerData);
      print('fngdfkngdf');
      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url, Map<String, String> headerData) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headerData);
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode: ${response.statusCode}');
    }
  }
}
